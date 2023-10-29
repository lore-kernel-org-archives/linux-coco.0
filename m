Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C26B666
	for <linux-coco@lists.linux.dev>; Sun, 29 Oct 2023 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpJcOv8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698589427; x=1730125427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TRjASw0YiznO3WvwpwfHDnA6Y5I6mL2iMy28CyYTpIQ=;
  b=MpJcOv8y/WXaJ3ckx7J5oloERjoc7gMaOBONHZp1TJgEWdAKQoXIRT57
   4hdAbpq8vE4XffFBY7G/d0sc/XNlOLUzyXNReTPbrD43kSk5iGcjK/0Yq
   xVHVGQPjUVCcWnUv9p7FtjbIcmWOSLWT54MHTkT9TeOdEdz4WBBjQrITp
   EJrGh4ID5EdeVuKW4n0cMKNZP/56LpSSJnt+lmymjbVI7RD3pQVbj3UwP
   7KRdpGoE+kfACNbKRwQLapBX4tT4pTZZcyabnlol2uCJOspZRr3pJaKh7
   PNhpCcMaETxMiNSA9f4ArDmpSbbJGWRh2Gbq7dg8QFvd1cCco7Cype0aG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="391817797"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="391817797"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 07:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="1289679"
Received: from aafra-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.32.230])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 07:23:27 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id B5C9B10A29C; Sun, 29 Oct 2023 17:23:37 +0300 (+03)
Date: Sun, 29 Oct 2023 17:23:37 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 02/13] kernel/cpu: Add support for declaring CPU
 offlining not supported
Message-ID: <20231029142337.54cvg7cuwlmr3bzc@box>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-3-kirill.shutemov@linux.intel.com>
 <87a5s225vp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5s225vp.ffs@tglx>

On Sat, Oct 28, 2023 at 04:12:10PM +0200, Thomas Gleixner wrote:
> On Fri, Oct 20 2023 at 18:12, Kirill A. Shutemov wrote:
> 
> Subject: cpu/hotplug: ...
> 
> > ACPI MADT doesn't allow to offline CPU after it got woke up.
> 
> ACPI MADT is a table ...
> 
> This is about the MADT mailbox wakeup method, right?
> 
> > Currently offlining hotplug prevented based on the confidential
> 
> is prevented
> 
> > computing attribute which is set for Intel TDX. But TDX is not
> > the only possible user of the wake up method.
> >
> > Introduce cpu_hotplug_not_supported() that can be called to indicate
> > that CPU offlining should be disabled.
> 
> Otherwise the changes look good!

Thanks!

Thomas, could you take a look if the last patch in the series is sane?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
