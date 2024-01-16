Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FA01CA8A
	for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705424554; cv=none; b=fOdj4KyIzeAJUaXybhz1a9VgFXX1DPeH6mq/HkthFQBx90uSbUimRFP4JfzhRfA33QeWBuh7W1BSKN7rtaEuh76tcgn708e2YcMDotFvCSDor7s5qt6mFS+kQHKLfOqdC4rGCITKOUyjivDlh4wbyIEO8odj3ErSWBPLOKRVZvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705424554; c=relaxed/simple;
	bh=W5qlSOrOPnf06NpnZ5IqQM7YnmklSyj2ZEoUbqEujIw=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Message-ID:Subject:From:To:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=EaiH1xZOUOpWsxSUysVmcWT3KpfrsiGuaN7Y4I0reo48kljtgOiXwEv+o0W/gU7wNDJopZwvP2Z9l/gq8CXOvB96c3l/5LL2Uu/U41xCIPGpC4YywI8PXHPo1T5Qn4hR4PCYXiFzAZxl2lOa2ySRSnnr92oufgaQvZ7u7D8thWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nn8WFOkx
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn8WFOkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705424553; x=1736960553;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=W5qlSOrOPnf06NpnZ5IqQM7YnmklSyj2ZEoUbqEujIw=;
  b=nn8WFOkx4ikD/od6y2tLlAnhAkgxVowApFt+5nxBUyQbHbyCTm62sQ+6
   KCL9OBEDhuCs/YakQAtfRlKxHefd7+Jwm283AqMVLWAYisRwD3h38dOIq
   FYxXn4cmf41JtgwR15SrX4JcEoBPZv95G9utvpZ0fqEpgUjClthPcwctW
   v1Y2f+Ae1qWb4imuzHAIXx/si7sR8CcYh7G5B+iGYT8+g1Q5KSVl+eCMU
   7F/VJYys2h7UCbEjJ3xQXeAXSrEdpuwvUd34oJt4a/ZZZhEYNb1z9UmPM
   aR4v50KloWBfjvmU3nULIO5bFu7SLx6NZen8ISLIlOVC+Fc77hEheTAUA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6632874"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6632874"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 09:02:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="818220972"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="818220972"
Received: from ticela-or-353.amr.corp.intel.com ([10.209.70.241])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 09:02:30 -0800
Message-ID: <ad55e4845edfd052538b5e80ae7ff2a67820424c.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/3] x86/hyperv: Use slow_virt_to_phys() in page
 transition hypervisor callback
From: "rick.p.edgecombe@linux.intel.com" <rick.p.edgecombe@linux.intel.com>
To: mhklinux@outlook.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de,  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
 kirill.shutemov@linux.intel.com, haiyangz@microsoft.com,
 wei.liu@kernel.org,  decui@microsoft.com, luto@kernel.org,
 peterz@infradead.org,  akpm@linux-foundation.org, urezki@gmail.com,
 hch@infradead.org, lstoakes@gmail.com,  thomas.lendacky@amd.com,
 ardb@kernel.org, jroedel@suse.de, seanjc@google.com, 
 sathyanarayanan.kuppuswamy@linux.intel.com, linux-kernel@vger.kernel.org, 
 linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 16 Jan 2024 09:02:29 -0800
In-Reply-To: <20240116022008.1023398-2-mhklinux@outlook.com>
References: <20240116022008.1023398-1-mhklinux@outlook.com>
	 <20240116022008.1023398-2-mhklinux@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2024-01-15 at 18:20 -0800, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
>=20
> In preparation for temporarily marking pages not present during a
> transition between encrypted and decrypted, use slow_virt_to_phys()
> in the hypervisor callback. As long as the PFN is correct,
> slow_virt_to_phys() works even if the leaf PTE is not present.
> The existing functions that depend on vmalloc_to_page() all
> require that the leaf PTE be marked present, so they don't work.
>=20
> Update the comments for slow_virt_to_phys() to note this broader
> usage
> and the requirement to work even if the PTE is not marked present.
>=20
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
