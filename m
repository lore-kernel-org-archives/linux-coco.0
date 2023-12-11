Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C0F9F0
	for <linux-coco@lists.linux.dev>; Mon, 11 Dec 2023 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSeG5MbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702336245; x=1733872245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fdZ2x/5+NDcHqfPGDDUoiJaMPSKPPuvvjvF9z/kpukA=;
  b=XSeG5MbPFubpX8lN6e4Yi+l+5e/KT4SS6De267ImxokQ/gnhUGD218Is
   g5c/ZFkFTblTC2WW9veWyxUNXYfA5daPIM5NSJGe4cN3/thH+zmkoxXQ2
   v9vfjJ1K5SUh69EgNs5v7jj3J3pON0vW25P69h5D94JVLvEO0/gf4/lFB
   BCf50/KOU59mCh7thkoxB+/tzLsDXN9DkVIgFi48ZXItXV+B2qUYAff8r
   k3PxkuyABKJ6tWhg3L9JqGR7+Faa3GPg/XsL+i1PtgEAM7YevDyQUCC9A
   pcf+Hwf10OLcz/uXitAB+H71xox+AEe9JIYzVoOyw2CD41FDmlQSo5eeW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374229720"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="374229720"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 15:10:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722994661"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="722994661"
Received: from liviuoct-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.47.81])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 15:10:38 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 9998110A290; Tue, 12 Dec 2023 02:10:35 +0300 (+03)
Date: Tue, 12 Dec 2023 02:10:35 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	"Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCHv4 05/14] x86/kvm: Do not try to disable kvmclock if it
 was not enabled
Message-ID: <20231211231035.743cesujphsp5eve@box.shutemov.name>
References: <20231205004510.27164-1-kirill.shutemov@linux.intel.com>
 <20231205004510.27164-6-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205004510.27164-6-kirill.shutemov@linux.intel.com>

On Tue, Dec 05, 2023 at 03:45:01AM +0300, Kirill A. Shutemov wrote:
> kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
> present in the VM. It leads to write to a MSR that doesn't exist on some
> configurations, namely in TDX guest:
> 
> 	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
> 	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)
> 
> kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
> features.
> 
> Do not disable kvmclock if it was not enabled.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Wanpeng Li <wanpengli@tencent.com>

Paolo, Sean, any chance you can get it in through KVM tree while the rest
of kexec patchset is pending? The problem is visible on normal reboot too.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
