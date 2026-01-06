Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19613C8E8
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 00:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660397; cv=none; b=tOBWrFz4FfuYxsj/agrLcXHri2BMQ7m5w9Z9l8k81PEgqJr4Qd8q6OJopnwp9koNEsiUoJFiq7GzLLOp6AmTANJcWKwJxRv95Nbrc50nbmPwsF64VFpw/8pJy/+0sGz71M81n46xk5zUqYKTbv5PyeRZVBpDsUuvO66geS70i5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660397; c=relaxed/simple;
	bh=5hFj7GqvOyjRHYvwqA3PcPI8qz8tK4aweW/08yWjYto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDbVQOVQA76KOZYlHdXFGAchSvGkE8JccxguapgAPMhCrxexMsLLpGkwyly5zK1KsmtQ+W3kFRZWoWX1SZiZFj+/hDUu7mMpkFop0L7HW1V7jsvDkIV2v4Asy7R/loeMbhZ8G5TfOTAIszQRrwDAGmoudhsX52K7DylZh2oH1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VU4ezFdm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VU4ezFdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767660396; x=1799196396;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5hFj7GqvOyjRHYvwqA3PcPI8qz8tK4aweW/08yWjYto=;
  b=VU4ezFdmi8X74ktLzVzLjD29K36Ly7HW63+z7t6Dya3oLmNz5x6yaC7A
   7HeFwK3GjdhMxySiGp+p5OKxEZ8aqAq/QeLFq2Kskp5B4cJk2W2tE7Oqj
   ggN+lluilqcd6Nxg4xLIYZUfxPbHoWIrLOOIxu23Ji7tnflZKFWAJV3W6
   efZVi5IgDwg2LYjBBF6k2aA2AgclE5JDOvLtYtVgDVkCPchVxKNEX8RCb
   7CpYp5TOwklrtpd9mhVwJfcjQaB+bEk+PHQeuDfuygFVP9ii9GunjAuq5
   vY6oKvdhsYoOWTmxMp+R8+FSn3XI282shmogUBECMeCQd9rdBR5BzaRR1
   A==;
X-CSE-ConnectionGUID: zyw/+rh4Q+KmVfap4K4UdQ==
X-CSE-MsgGUID: gFuPj/VgT5+GS2goV11aAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79334333"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="79334333"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 16:46:36 -0800
X-CSE-ConnectionGUID: SeaYkonOS6+5r4Bw09oi+Q==
X-CSE-MsgGUID: 4pGyv4gVTuOuzmBR9dhnkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="226075796"
Received: from dwesterg-mobl1.amr.corp.intel.com (HELO [10.125.109.56]) ([10.125.109.56])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 16:46:34 -0800
Message-ID: <4c8524e5-b3e1-4113-a4e3-d3615465d9a8@intel.com>
Date: Mon, 5 Jan 2026 16:46:34 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "Paravisor" Feature Enumeration
To: Jon Lange <jlange@microsoft.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Starks
 <John.Starks@microsoft.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <695c50eee68e3_4b7a100e8@dwillia2-mobl4.notmuch>
 <CH8PR21MB52221DBBF4D87FC24013FACFCA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <CH8PR21MB52221DBBF4D87FC24013FACFCA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 16:10, Jon Lange wrote:
> It's not clear to me what advantages are gained by reflecting ACPI
> information into CPUID.  ACPI is already available and is usable
> across architectures, unlike CPUID.  What advantage is gained by
> replicating the information into CPUID?

If there is an ACPI approach that is expressive and agile enough to
convey the necessary information, then there's zero reason to replicate
it anywhere, CPUID included.

Like I said in the mail to Dan, I _think_ the current state of the art
for host=>guest enumeration involves ACPI wrapping DeviceTree properties
on ARM which mirror x86 CPUID bits.

> In the LPC session that Dave cites, Dan (I think it was Dan) threw
> out another suggestion: have the hypervisor driver detect the
> paravisor configuration using whatever is appropriate for that
> hypervisor architecture.  I find this to be a very attractive
> direction because it eliminates the need to define standards that
> can be supported across hypervisors (and across virtual firmware
> implementations), and reduces it just to a small set of concepts
> that can be fed into the kernel.  This could keep the enumeration
> out of the hands of ACPI altogether - thus no slow standards
> development.  Are there downsides to this approach that make it
> unattractive?
I think you're saying that we'd have a fixed set of Linux-defined
features. Hypervisor drivers would set the features up. Generic,
architecture and vendor-neutral code would consume the feature enumeration.

That sounds familiar and sane to me. It's generally what we have with
the Linux-defined X86_FEATURE_* bits. Linux defines their behavior and
consumes them in generic code. x86 vendor-specific code sets them.
