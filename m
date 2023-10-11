Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB11A27C
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH4dAKQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697029872; x=1728565872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B53XM39BYMuTT2q7Eh2SVAroSIYenFGSlmbpBE0jnKI=;
  b=NH4dAKQB4GRZV5M1RruySZnNpy2hyxUy4Ea3qgXM0jDo7w4he1XU5oqI
   h2zB9vFNbNI+TeymLgwMdqOaT7Lu7tcfn6xKEL4cjUbBshb152LeLMhBv
   d7nUtmaCI3hTVOMlvq/zUp7U0jTyj6zUWcU6t5yEmViYr3xwQleClHiRW
   9S8PfvSetrfN/rTGLXdcJS9cvWBlsneEAuuKF1WUFun1At6aFP4skyUCR
   A+TAr69Tl+TFTUmrRpwUtFQzpFTgRdJqFRBJiEPMQnDHl0H8cZlzTKaLV
   gpJgfTDYpt8b2M2BX6bOgUhsQu8CkU6rjnKWJirpqwE3zsMalbtelg33+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383522368"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="383522368"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747443328"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="747443328"
Received: from laptop-dan-intel.ccr.corp.intel.com (HELO box.shutemov.name) ([10.252.56.166])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:11:06 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id C1E03109FB5; Wed, 11 Oct 2023 16:11:03 +0300 (+03)
Date: Wed, 11 Oct 2023 16:11:03 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/13] x86/kvm: Do not try to disable kvmclock if it was
 not enabled
Message-ID: <20231011131103.6p6l3gpklsaybygy@box.shutemov.name>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-5-kirill.shutemov@linux.intel.com>
 <b69b21b8-7915-4854-b5f7-5124cd4e5bbf@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b69b21b8-7915-4854-b5f7-5124cd4e5bbf@linux.intel.com>

On Tue, Oct 10, 2023 at 06:53:27AM -0700, Kuppuswamy Sathyanarayanan wrote:
> 
> 
> On 10/5/2023 6:13 AM, Kirill A. Shutemov wrote:
> > kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
> > present in the VM. It leads to write to a MSR that doesn't exist on some
> > configurations, namely in TDX guest:
> > 
> > 	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
> > 	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)
> > 
> > kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
> > features.
> > 
> > Do not disable kvmclock if it was not enumerated or disabled by user
> > from kernel command line.
> 
> For the above warning,  check for CLOCKSOURCE and CLOCKSOURCE2
> feature is sufficient, right? Do we need to include user/command-line
> disable check here?

The command line disables kvmclock, even if it is enumerated, so disabling
it is not needed.

Anyway, I reworked the patch already based on Sean's feedback. No need in
taking parameter into account directly now.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
