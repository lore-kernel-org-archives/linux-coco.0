Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B9D20C001
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300596; cv=none; b=nmnqQTnR1GLVkxtYHTrkKwXXNI8T2WR7mYFhUIdug+Bc+HSkBbDOo1O/QiT7Jf3GZuAQFYKiirC+BV3y1Z6d9mNpCXLI/7c/ba4X7hp1s6/hPJia6627SsxJBnG091j6H2BOnDoMLMgyUuIPWQ0dNTMGnmALKd5OY6QfP5rIfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300596; c=relaxed/simple;
	bh=Nm5lWHhR2bSNlHHJ1i5GaLxw46Jh/lbrsRa24gtvpno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBbnF5JMA6Fz0bp7jJQNlnpzDYDYsRckp10cmQsqZA7YDwjpNKVo5S/aujmnq8NpkCO48wChIe3uPOJIS5nnsC7FUiEK/5KWFwyhtpHoNY7etkWjVBjTzK/EGPfWbEr5zeTp7wl513JUyBP0GVgkvI390sU/0PHDFXTdsmf2+a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dd2ZLse+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd2ZLse+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742300595; x=1773836595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nm5lWHhR2bSNlHHJ1i5GaLxw46Jh/lbrsRa24gtvpno=;
  b=dd2ZLse+IPKInVJQC5dfacQ4zCJLeo+09MSjXHWzPYbsiNc4TQ31Nzhy
   o7hfWZXZzDdichy/KONHxtAMpfrB2wcdx9VoBgXNzc47Rk84LpsJQ7NE/
   YGpZaU2QU7QZznmoCCFqs9ON652W7HfhkrTF8vQAoIsDKj81hf3QvvedQ
   uj1hl5F1mxYYiy9s+sSnRHKRjbDUGZJZd2wNUl8pucJZXq7cXFcE3nzHa
   rS3WJ19o3CntPZAM7IAKwxBbWeJ6YEw1htRB0hg+ORhf/0e8hRe/ybRKn
   Z21q5EEzWD7J/r2cg2VYVYQuiIw0DELfptP0IJzYOSAMw4GHyzSyi7Hb8
   g==;
X-CSE-ConnectionGUID: 5jhhRfS7SCKqJVuhut28LA==
X-CSE-MsgGUID: /fIrbtMzTWaB7Meytce+sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54113104"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="54113104"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 05:23:14 -0700
X-CSE-ConnectionGUID: QNvabbolSsaOb2TkfNNgQA==
X-CSE-MsgGUID: ChNxU6OPS36tWUHDkvR6BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127283744"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Mar 2025 05:23:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 489AC1D8; Tue, 18 Mar 2025 14:23:11 +0200 (EET)
Date: Tue, 18 Mar 2025 14:23:11 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	x86@kernel.org, linux-kernel@vger.kernel.org, vannapurve@google.com, 
	Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
Message-ID: <guatjzjzipzjzvj4oou2gktxmzileawshxmxj22hsa5kmet5g4@2rhf7tzaiytw>
References: <20250318113604.297726-1-nik.borisov@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318113604.297726-1-nik.borisov@suse.com>

On Tue, Mar 18, 2025 at 01:36:04PM +0200, Nikolay Borisov wrote:
> If a piece of memory is read from /dev/mem that falls outside of the
> System Ram region i.e bios data region the kernel creates a shared
> mapping via xlate_dev_mem_ptr() (this behavior was introduced by
> 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()"). This results
> in a region having both a shared and a private mapping.
> 
> Subsequent accesses to this region via the private mapping induce a
> SEPT violation and a crash of the VMM.

Crash of VMM or TD termination? If VMM crashes in this case, it has to be
fixed.

> In this particular case the
> scenario was a userspace process reading something from the bios data
> area at address 0x497 which creates a shared mapping, and a followup
> reboot accessing __va(0x472) which access pfn 0 via the private mapping
> causing mayhem.

I think it should lead to unrecoverable EPT-violation, but not VMM crash.

> Fix this by simply forbidding access to /dev/mem when running as an TDX
> guest.

I think we need to think wider. What about applying a subset of LOCKDOWN_*
in all coco guests by default. Many of them are relevant for the guest security.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
