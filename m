Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4E16F8E9
	for <linux-coco@lists.linux.dev>; Thu, 22 Aug 2024 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724314724; cv=none; b=C7ZlkdttrVeND48mcifJ+yikgZYts4GKzziy3aRNzGEtbF2TgqoNwqTdFzrUm4whucdhQN6Sz5k6b2+Ke0ujzbk2WMmR5M8D1L9RtfE8gv8fqmjhpPFlea98DekCiBz3u9blseV7b9HUql19qf6nbJ6QgbI3WguBA7bQyp0qIfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724314724; c=relaxed/simple;
	bh=9MmmmklF/yizWWGEjFJjdie1UnunmTEc9qKCljXIsPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f01wRZ+yjwKmKE7YueGGZEtphMgAyfayIQHvMXAUtMIyjQkmL/1NBB6IzNs8GHdP/ivjyMh802kz/OKMU3cfqHROOU0/XQmhLLaHsuwDOgVAx+Wkq9tYArVFoe2FABRUKvZQa/WaQb03X/WKWeDAlaf3iGEme/tUeHcW79qvxss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3InFd/q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3InFd/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724314723; x=1755850723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9MmmmklF/yizWWGEjFJjdie1UnunmTEc9qKCljXIsPk=;
  b=K3InFd/qDEpu1yh0gtgWjGD/sy8xukH0vHReqXxXrIhmx9BuirTZNfcp
   K8nafcgdP2ItICJeyUuAqeYVTX5pNej0KaL4GhlXkFnmmP9cJzOweyhNv
   8jTXwPZzn4bKh1B3iWcRcHfartDoyTnED+P7MVD6TvO9Gxe3QOuT3EOJe
   eAh4K0sy3mXT3ERT3MoASjFmpgNxLBZIb5vQ9IQZRE7uYoX1CMEN4EZ4/
   SHzNfb183qfpv8M+A4Xu315JsYQ4f0IBFe7w0xynyJXjGDVfnfCayAWzv
   u0G6S1A2XuzEQykJu4t/UTmeXYNrbeB5cy1wD/3iQbBw2TNXDtqD8s/GM
   g==;
X-CSE-ConnectionGUID: gNZzgyN7SP2LzEoaB3YZeQ==
X-CSE-MsgGUID: MJInBEAiR8y+EqvhpFiaNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22883568"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22883568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 01:18:38 -0700
X-CSE-ConnectionGUID: TeokA5NzSNCcM9jW0lovwQ==
X-CSE-MsgGUID: 2rB7pi9BQSGJBX9jXJ4zqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="98863154"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2024 01:18:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 5349E43E; Thu, 22 Aug 2024 11:18:05 +0300 (EEST)
Date: Thu, 22 Aug 2024 11:18:05 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yuan Yao <yuan.yao@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yuntao Wang <ytcoode@gmail.com>, Kai Huang <kai.huang@intel.com>, 
	Baoquan He <bhe@redhat.com>, Oleg Nesterov <oleg@redhat.com>, cho@microsoft.com, 
	decui@microsoft.com, John.Starks@microsoft.com
Subject: Re: [PATCH v4 4/6] x86/tdx: Add a restriction on access to MMIO
 address
Message-ID: <fzaia3kslzfxj35mmarkpydlt73ha7fr6qo2ub47zfu7l6f7c4@axlrzkeqavod>
References: <cover.1723807851.git.legion@kernel.org>
 <cover.1724248680.git.legion@kernel.org>
 <0d4381397c33426bda5d3b0e5541965dcebdf962.1724248680.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d4381397c33426bda5d3b0e5541965dcebdf962.1724248680.git.legion@kernel.org>

On Wed, Aug 21, 2024 at 04:24:36PM +0200, Alexey Gladkov wrote:
> From: "Alexey Gladkov (Intel)" <legion@kernel.org>
> 
> In the case of userspace MMIO, if the user instruction + MAX_INSN_SIZE
> straddles page, then the "fetch" in the kernel could trigger a #VE.

It has nothing to do with "straddling page". It's about tricking kernel
into doing MMIO on user address.

For instance, if in response to a syscall, kernel does put_user() and the
target address is MMIO mapping in userspace, current #VE handler threat
this access as kernel MMIO which is wrong and have security implications.

> In
> this case the kernel would handle this second #VE as a !user_mode() MMIO.
> That way, additional address verifications can be avoided.
> 
> The scenario of accessing userspace MMIO addresses from kernelspace does
> not seem appropriate under normal circumstances. Until there is a
> specific usecase for such a scenario it can be disabled.
> 
> Signed-off-by: Alexey Gladkov (Intel) <legion@kernel.org>

Cc: stable@ please.

and this patch has to go ahead of the patchset, targeting x86/urgent
branch.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
