Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C71CA87
	for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705425015; cv=none; b=pAaD0/BiDVMWZALUtpy+mJI1AB7hgok/95J3FWZl0yGDSbCX2XW8XBGlik7mma4o/FkN0MKQ9Ir6IPDGUdjajpXOtSV/gNyiMzLoSFPs1OOjbPC3QBR0YgBcxP+iIIj9mvh4RenWkMSm3Nh6bUNbCfWAT2Ak+PV1SAEQe+NcL34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705425015; c=relaxed/simple;
	bh=+F0EM0MyQ7NcCg3Ixxu9z5Tybad96Gl5Tf0YqH4Dt+U=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version; b=px7e8vCitI9OMWLGICObQDr0fsfx69l5Dlyau+o6Rl8V0RebldUHLZg5SgghXX27Xc50ZfB/mIBrusZs2lh+nt5eBY+li8qdMy6XDz0V2EWIddX5Q6o9Vq1JHiTmF7LxxyT/zx3koNf/3KvHuHrFk+FujSjUkcY6Y75z9J3+YHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xstv9LeX
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xstv9LeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705425015; x=1736961015;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=+F0EM0MyQ7NcCg3Ixxu9z5Tybad96Gl5Tf0YqH4Dt+U=;
  b=Xstv9LeXTvSVw72Czqyxv7D6nSClnMgODSlV7ch5z2WpXCgSNipj/MIM
   A2nROCn05ZLe+dF1dLUZTIq6mB6FiTFECrzCqez06Geu/R7QXybNtxpFX
   uenpt446uLt2RRH6xgHU1uGvF4L44drOnJYp3TUkHN/0GZKff8YtVhQnW
   WQM68AsGgkt9wLnb3vLTlHdyJnJlM6OxuaDIKT3XXU8CBPkZaYe0WSnfq
   0ORqHk+pvwA33fmYGwgAJaMExNAwTTSA+WAuD2LhqUFpRIStVGDP8Kgk/
   60+Kcl/w99pVC1lHnP1LkV//Wg38mB66eU46gR+HQCGWXFAYeXJfPjDQU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7295103"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="7295103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 09:10:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="32529976"
Received: from ticela-or-353.amr.corp.intel.com ([10.209.70.241])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 09:10:09 -0800
Message-ID: <76352c8a2a91135b0fcc9041b6f6e06ff0e0a971.camel@linux.intel.com>
Subject: Re: [PATCH v4 0/3] x86/hyperv: Mark CoCo VM pages not present when
 changing encrypted state
From: Rick Edgecombe <rick.p.edgecombe@linux.intel.com>
To: mhklinux@outlook.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de,  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
 kirill.shutemov@linux.intel.com, haiyangz@microsoft.com,
 wei.liu@kernel.org,  decui@microsoft.com, luto@kernel.org,
 peterz@infradead.org,  akpm@linux-foundation.org, urezki@gmail.com,
 hch@infradead.org, lstoakes@gmail.com,  thomas.lendacky@amd.com,
 ardb@kernel.org, jroedel@suse.de, seanjc@google.com, 
 sathyanarayanan.kuppuswamy@linux.intel.com, linux-kernel@vger.kernel.org, 
 linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 16 Jan 2024 09:10:08 -0800
In-Reply-To: <20240116022008.1023398-1-mhklinux@outlook.com>
References: <20240116022008.1023398-1-mhklinux@outlook.com>
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
> =C2=A0 x86/hyperv: Use slow_virt_to_phys() in page transition hypervisor
> =C2=A0=C2=A0=C2=A0 callback
> =C2=A0 x86/mm: Regularize set_memory_p() parameters and make non-static
> =C2=A0 x86/hyperv: Make encrypted/decrypted changes safe for
> =C2=A0=C2=A0=C2=A0 load_unaligned_zeropad()

I'm not clear on the HyperV specifics, but everything else looked good
to me. Thanks.
