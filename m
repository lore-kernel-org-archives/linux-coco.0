Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78E246BC6
	for <linux-coco@lists.linux.dev>; Mon,  5 Jan 2026 21:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649349; cv=none; b=LkfAvvKovmnu+gNmJ+6wtHev9Hdr8hxVGhzIVn8LoxBzKJpdke4xwxs8E2lilek3cEzzTRl5TrqvLqhWO9lMStfqmWliULyeYhriVJqo2Nzp3zBMRFjpjepuSjfTWr+PvCUPIWijsHLMGeeIQ3oOrt+u+ieCXIol7BrMa6YVmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649349; c=relaxed/simple;
	bh=NMeLtiS3lAf7XV8u0qdKUmgXmV5pl6aeQNH4Vq6nKjg=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=hh++H24Dd24LPy+xv+eGef0ZO4JzCsM/qOuKABCq3xsUvuZuiw4rVCBfZ5jpRfp/sCuRvO074GJ/UVZeIHo9BotdszUgQ1qAPZQu9k+r8XSVl51L31O5RqaJ5zpCA7yuwLBn9Fi+ipIuuqW6wrz3l7/ZsAkLOTWMNC53++9Azxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4JLoct1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4JLoct1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767649348; x=1799185348;
  h=message-id:date:mime-version:from:to:subject:cc:
   content-transfer-encoding;
  bh=NMeLtiS3lAf7XV8u0qdKUmgXmV5pl6aeQNH4Vq6nKjg=;
  b=D4JLoct1+IAAKKROb5htBCbF6KtbqYfMzz8YLylys1TdtSgoRdzwwul5
   8aLAkErzrpUco2OXYyGG8ngNsKUiLIWi9QNp7FBW/D7JcleC/1GgNtWEZ
   X2KcFz5NKPRAWf23BMHOwu/Pjzt/ik9FB3R5vJ5MJrjLYEdZbyhzAwNYL
   WK0b88xPVV3bFclcq5L2D7WGmkyaqGcZj5VRtp3BgNyjk40IlrRTHzIEJ
   20cJ0N6W/Rx6xbpuld5/y8ySEwsgxGq+K8kCPg78g6nJ3b7OTJft8MrGk
   2sqDID6VukA7At/MMJvnr7LaSLwxNlCkNnhKFwjTW4jAVz1nBmVizh/9i
   Q==;
X-CSE-ConnectionGUID: JkSN2qfiTBq+PoOCoDUauQ==
X-CSE-MsgGUID: pl3A02YLTEisCkl/ujB5Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86609121"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="86609121"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 13:42:27 -0800
X-CSE-ConnectionGUID: HJSaYb6QRUCiKJaTxGryVw==
X-CSE-MsgGUID: 82e9BAQtQSq9MOcb4FWJeA==
X-ExtLoop1: 1
Received: from dwesterg-mobl1.amr.corp.intel.com (HELO [10.125.109.56]) ([10.125.109.56])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 13:42:27 -0800
Message-ID: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
Date: Mon, 5 Jan 2026 13:42:26 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
To: "Lange, Jon" <jlange@microsoft.com>
Subject: "Paravisor" Feature Enumeration
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
Cc: "Williams, Dan J" <dan.j.williams@intel.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, john.starks@microsoft.com,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

First,

Jon and John gave a talk in Tokyo about feature enumeration under
paravisors:

> https://lpc.events/event/19/contributions/2188/attachments/1896/4057/05-Paravisor-Integration-with-Confidential-Services.pdf

The tl;dr for me at least was that they'd like a common and consistent
means of enumerating these features in OSes, regardless of the
environment: TDX, SEV-SNP or even ARM CCA.

I wanted to explore one corner of the solution space a bit. There was a
pretty limited audience of folks in the room. Please feel free to flesh
out the cc list with anyone I missed.

Dan Williams' first thought seemed to revolve around having some kind of
platform-independent device that could do the enumeration. Maybe a
synthetic PCI device. I'm sure Dan can chime in to fill in the details
that I missed.

I immediately just thought of CPUID. We already have a whole region of
CPUID (0x40000000) that hypervisors use to enumerate stuff to guests by
convention. It wouldn't be a large leap at all to carve out a chunk of
that so that paravisors can use it.

But the biggest barrier I see there is that our ARM friends don't have
CPUID. It seems like they _mostly_ have bit-by-bit aliases in ACPI or
DeviceTree for the x86 CPUID bits, like:

	X86_FEATURE_KVM_CLOCKSOURCE in arm,pvclock
or
	X86_FEATURE_KVM_STEAL_TIME  in arm,kvm-steal-time

As far as I can tell, these aliases are all done ad-hoc. This approach
could obviously be extended to paravisor features, but it would probably
be on the slow side to do it for each new feature.

It _seems_ like we could pick a chunk of CPUID space (say 32-bits of it)
and alias it 1:1 with some DeviceTree/ACPI property, say
"arm,paravisor-features". Kernel code would just be written to say
"check feature 13" and the arch-specific helpers would either steer that
to CPUID or DeviceTree.

Is there anything like that today that's cross-architecture and
cross-hypervisor? Is there anything stopping us from carving out a chunk
of CPUID for this purpose?
