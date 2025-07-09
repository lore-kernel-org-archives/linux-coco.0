Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890C28A1C6
	for <linux-coco@lists.linux.dev>; Wed,  9 Jul 2025 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067873; cv=none; b=bIj6dNX7Gi9zZBkP4FQiaoBlNS5jtmQZ3doi6TGWrqiSFB8Me2saJ5q+Zp+YOl224kMzMq2BfKXDUpPmE2xYJ9AIXbl8ghW5b/0sY5sbeWp46xnEi3id8w6MH292JzCwGJJkStRl6M7dOYb+XJWrKkzrZNpjjxHSNbGv9lhnU4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067873; c=relaxed/simple;
	bh=UHDW8ZDAfnhhpmI6clemttOZzoKRv6zCBvWZLFReG9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq+pcjjKqFBM8oiEIXMvVyoIXcaoNxfabd1rNzFSkbLo5nmhN/Kihtlp72rHHKjg+Zzce4SFzg4ZnJGgW+u/ais5ENh6TUUmY+S5VOXgMbx0nk0RmafQ4krWwwR4yNUhPD5qHkFbEVHoa50hGXBVGvYI7OdaTYUI2O1UGfiF7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXTk1+Cz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXTk1+Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752067872; x=1783603872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UHDW8ZDAfnhhpmI6clemttOZzoKRv6zCBvWZLFReG9w=;
  b=fXTk1+CzELerQcxISZjmw9VdrVyYKW1ENN4E1nfF2TphhZvzn/MLkGvo
   SE4OKhO5MModWSfx3XhLygxWi+rU1Dyu1SgglgXsQRyjL9EB5/oiv/lVm
   rb4h5XEgnwTzmPWLFUhD4JoXH9Jxp/hYh62hcpi/wTBxaC9k2h6S9LnIJ
   uPLvmtn3XMNKwChYWqgfLlu2rnHAr6HAlxsYWNJPj/snngw1dnp53566o
   tGdgSbduuxSgfJlKlaRMk3tT/PsVO7F/HZa8+hfRdRF70bEfIGNiYX1qy
   /DowLT7BPlUOamj5EqSK2UOh3C1jHiWONtGpNeh6s0EHMmsVX1UdqmH+p
   w==;
X-CSE-ConnectionGUID: asP2riRbSw2nawEVNqF88w==
X-CSE-MsgGUID: SYKwfigeR5aND98Hsqpp2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65026896"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="65026896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 06:31:12 -0700
X-CSE-ConnectionGUID: JF5YtQFATR29zDJFKi8G9Q==
X-CSE-MsgGUID: u7OG3qiySYGEGbvwpdkJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156344642"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jul 2025 06:31:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id EEE521B7; Wed, 09 Jul 2025 16:31:06 +0300 (EEST)
Date: Wed, 9 Jul 2025 16:31:06 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the file list in the TDX entry.
Message-ID: <zxgwojg556ni4ap7wago27hsjlawvjfdsgya6toxp5jrricffl@aploj7ygic45>
References: <20250708101922.50560-1-kirill.shutemov@linux.intel.com>
 <20250708101922.50560-2-kirill.shutemov@linux.intel.com>
 <4068a586-532f-4c87-bcd3-c345cbf168c0@intel.com>
 <ebdba9aa-ce65-44c9-97f4-cae74a4db586@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebdba9aa-ce65-44c9-97f4-cae74a4db586@intel.com>

On Tue, Jul 08, 2025 at 09:26:21PM -0700, Dave Hansen wrote:
> On 7/8/25 20:31, Xiaoyao Li wrote:
> > On 7/8/2025 6:19 PM, Kirill A. Shutemov wrote:
> >> Include files that were previously missed in the TDX entry file list.
> >> It also includes the recently added KVM enabling.
> > 
> > Side topic:
> > 
> > Could we add kvm maillist to the "L:" ?
> 
> Sure, but send another patch please.

Xiaoyao, do you want to send a patch, or should I?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
