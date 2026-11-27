Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784098;
	b=IvjT3txoX08ojb17FxVAzGMMzLVMeec0oNLAoyW/FwhzKaUpNFUF9Otp9y0n0lY3R9p6
	 TTnu5BwuN7c73gAWcRxgVwpBjNak4IYvP2nPfup6iIKwWaDbletwX+xkOeKOvZdmpD3uK
	 Jo8n35uVChcNxQst4Y5hwuPaBj0zEt4Ey+7mRApixzDl6BxAQzVy92DSkRdi3p+QcJtxx
	 PGdLVDiFwlhNptyAkBL6K8NKenVxeOfBcxGldoqzHIB7LG85OeocGEkXTwv3CwOevE4eo
	 s3dsOCeEWHbh3RVksMU20PMG76sjtWB+dlo+MxbMXnmBFuUpKePL+yetSjrD01mNVig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BIsNU2toYcPxvRASiDSGEyVwKK+YxJ3krLZbrLRoCLo=;
	b=HS7/Dzt2t+WReFt7FBQnVllE8S8uf/IzNwWBiUeEEF3tWi5gx1BlqiRMKLcwHRzWT7fu
	 SyKu7LFado6SpedIp7/3jEhSNKloOJfh3TrPmOz5dIBcZupd4Ye9b8eJ4y89PXPm2Ke7J
	 sflUMd7dAZq8+mmY2Kjg+imUSIMSEMTSdtUL/KvnE81z5CBHRpmWpqK5edk/pkiAduoVs
	 6rsVxSkk1wccOec2sT9e8/x/2f9jnfQNj/3MgSoVjMbKVJxGtBVlzmvctw0L8Uwm1TRWG
	 z+H6V5i7j+zF1ucHuBQtkuqdTgmb1ENLfq8No0trFyVIWh9jToKBLO2beBMKW2AhHwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=EySJSr32;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44C606A324
	for <linux-coco@lists.linux.dev>; Fri, 27 Nov 2026 12:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB44C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=EySJSr32
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so6952106e87.1
        for <linux-coco@lists.linux.dev>; Fri, 27 Nov 2026 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795784095; x=1796388895; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIsNU2toYcPxvRASiDSGEyVwKK+YxJ3krLZbrLRoCLo=;
        b=EySJSr324hp0V7AmTeW5cTXazAdbuL4FPPDuIV+P8DEhoLqf47nCkaeiVS/3M3ljix
         Zagmvxu/xoxKSU7dfSgujZ4g9ss8Y5EeqgU1TMlhbTOiCAu12Gvb+A/4MO5xi0RCPv2C
         eurXZAbpwByOMSg3dRZMKWXqMHeFBBQ733lQewp4F2DrSrdcp46mpa/xuMSbn+IbcIKm
         F9o7KNrO1EuRlUFvrO04Y2/Ik8O9DnWBIBYbGz5TLFuPCSRI/igVIRk2xsrO8AGklJFp
         ESZW6zqN/lEc7sLLjnmY3eO81yyy5qtsKYqaw05eRnhEsIAqgxfstcECrZ2VfSXJ+hCn
         2F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784095; x=1796388895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIsNU2toYcPxvRASiDSGEyVwKK+YxJ3krLZbrLRoCLo=;
        b=nXnwJmIeHz8QY7wkYXSG/nEZFga7p5kPjZSqRoGnALPA95bywwsG5/S3z0nKfByN7G
         vr41tM2HPCv09uhMEIPaXsTZx2FFZImomqBiZpnwi7ozaIq/eXvs43iKaprXWQJCaUtL
         QpS0pkmMIECKyas7w9bIHebojQ2uZFePdqKFA1A/THVlPyKSgSvViAoirRSq/E2HtFOo
         9tPlimooLnnafebFSVAeKVu4WyqvLQcZ8cc9xoclG7jNfAeSeDucjyGd9nL2pNOEcqKf
         4JC5YLu7F2T/gKt5OyLc5b6ml9lBXwHk57VdjxLbbWap2E0I5UxARfyrRK9aQC0bhIQS
         bgfg==
X-Gm-Message-State: APuU4Z/63AzwGaChf/oWREPPrzmCP9VFUYoHv+gtFqLHdwYWo8c2qD1b
	SXaHyh/3MbH3ps7f9DE7+h/iK7V4gmLTrtmdFS9PlwgrLLawk7rZshl01Knii6Z4MuU=
X-Gm-Gg: AZFdTZfIxelYjvr2xkbZMkaPxWoip/1OurIXvCWDrs9Agr6t06KtKN2WBlHBKjCoMRm
	JnJJ5W3XO4qYQreQgoezvtirJMOmAjmxq8tdwCW/Zh9GYuGfezM1ji1nY1GhFBg7pC9c7GbfYa1
	sopCSEoGBT+fN2YhEJoB2m/1aSIkSC3j71AwAYXAQxVSKddBdkbRL8aI3OaTv0UnzMbPMeyjG1q
	CFwSS6OfzsDMJ9MNxY96PKXVLcovJNU0zdsybM0dO/eLCgpZJar7Lzvjf4dfF5qEbx3tFp3CzMW
	7VtvwDpkRSkC8COjF0cFK1J2U5rnCJAJzzGllYQALQnXok+aMF3CckWltrMK4VLiHP3fg7VhRc8
	hdYFCtmSbPsXjySHeQVmwRM/DNBAzpScseZHAwzG6dHfVlb96/LhFbhvpoGIcoEOI3/Q69YVU48
	ojLP2hjQRg9tJXcjViulmPa9iXZ7EpOP+zKDtku9tBZOKm81FFvW93wRkJcgNQyB4YV6zRA2Gnk
	Q1FeTq6oHhFiifto1QrET+nEcMEQyk3cYHfxWKvCP7AMx0bFh9o9oTKDOjh3hrFSrVFsYaBPhXP
	BGJx3XADbcMZIg9aFDuAAeYA50t/eFSnyQO4OtIo
X-Received: by 2002:ac2:4bd5:0:b0:5c1:5986:cd2 with SMTP id 2adb3069b0e04-5c1bc82f327mr8185787e87.56.1795784094485;
        Fri, 27 Nov 2026 04:54:54 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd079047sm5936259e87.76.2026.11.27.04.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:54:53 -0800 (PST)
Date: Fri, 27 Nov 2026 13:54:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, jarkko@kernel.org, zohar@linux.ibm.com, 
	yeoreum.yun@arm.com, aneesh.kumar@kernel.org, dave.jiang@intel.com, 
	nik.borisov@suse.com, sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 1/9] attestation: Add the base family
 specification and generated files
Message-ID: <awl4L8vEV5bvwE-Z@FV6GYCPJ69>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-2-jiri@resnulli.us>
 <179573913907.519186.8407997114208887089.b4-review@b4>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179573913907.519186.8407997114208887089.b4-review@b4>

Fri, Nov 27, 2026 at 01:25:39AM +0100, jgg@nvidia.com wrote:
>> [ ... 60 lines skipped ... ]
>> +++ b/Documentation/ctlv/abi/ctlv-attestation.yaml
>> @@ -0,0 +1,147 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Checked-in ABI snapshot of the ctlv-attestation family, from
>> +# Documentation/ctlv/specs/ctlv-attestation.yaml, written by
>> +# "make -C tools/ctlv regen".
>> +#
>> +# Updating the file is how a UAPI change gets reviewed; an update that
>> +# removes or renumbers anything, narrows a bound, or makes a member required
>> +# is an ABI break, whatever the file says afterwards.
>> +family: {name: ctlv-attestation, id: 1, inherits: ctlv}
>> +enums:
>> +  evidence-class: {signed: 1, event-log: 2}
>> +  evidence-format: {ccel: 1}
>> +  hash-algo: {$header: linux/hash_info.h, $enum: hash_algo,
>> +              $end: HASH_ALGO__LAST}
>
>I feel like this should parse the C enum into numbers here so the ABI
>can be checked too?

Well, note that this only works for uapi/ enums. So those are already
part of ABI. I don't think we need to do anything extra here.


>
>> +flags:
>> +  mr-device-caps: {extend: 0}
>> +  mr-caps: {extend: 0}
>> +records:
>> +  mr-desc:
>> +    id: 0x00010000
>> +    fields:
>> +      name: {number: 1, type: string, min-length: 1, max-length: 128}
>> +      supported-hash-algorithms: {number: 2, enum: hash-algo,
>> +                                  max-occurrences: hash-algo}
>> +      caps: {number: 3, flags: mr-caps}
>> +      register-index: {number: 4, type: uint, max: u32-max, optional: true}
>> +  mr-value:
>> +    id: 0x00020000
>> +    fields:
>> +      hash-algo: {number: 1, enum: hash-algo}
>> +      data: {number: 2, type: binary, min-length: 16, max-length: 64}
>> +  mr-generation:
>> +    id: 0x00030000
>> +    fields:
>> +      mr-generation: {number: 1, type: uint, max: u32-max}
>> +  mr-values:
>> +    id: 0x00040000
>> +    fields:
>> +      mr-values: {number: 1, record: mr-value, max-occurrences: hash-algo}
>> +  device-get request:
>> +    id: 0x80010000
>> +  device-get reply:
>> +    id: 0xc0010000
>> +    fields:
>> +      caps: {number: 1, record: device-get caps}
>> +      info: {number: 2, extension: device-info}
>> +  device-get caps:
>> +    id: 0xc0011000
>> +    fields:
>> +      evidence: {number: 1, record: device-get caps.evidence, optional: true}
>> +      mr: {number: 2, record: device-get caps.mr, optional: true}
>> +  device-get caps.evidence:
>> +    id: 0xc0011100
>> +    fields:
>> +      objects: {number: 1, record: device-get caps.evidence.objects,
>> +                max-occurrences: 16}
>> +  device-get caps.evidence.objects:
>> +    id: 0xc0011110
>> +    fields:
>> +      id: {number: 1, type: uint, max: 15}
>> +      class: {number: 2, enum: evidence-class}
>> +      formats: {number: 3, enum: evidence-format, max-occurrences: 4,
>> +                optional: true}
>> +      vendor-formats: {number: 4, enum: evidence-vendor-format,
>> +                       max-occurrences: 4, optional: true}
>> +      max-length: {number: 5, type: uint}
>> +      challenge-lengths:
>> +        {number: 6, record: device-get caps.evidence.objects.challenge-lengths,
>> +         max-occurrences: 8, optional: true}
>> +  device-get caps.evidence.objects.challenge-lengths:
>> +    id: 0xc0011111
>> +    fields:
>> +      length: {number: 1, type: uint, min: 1, max: 4K, unit: bytes,
>> +               optional: true}
>> +      min-length: {number: 2, type: uint, min: 1, max: 4K, unit: bytes,
>> +                   optional: true}
>> +      max-length: {number: 3, type: uint, min: 1, max: 4K, unit: bytes,
>> +                   optional: true}
>> +  device-get caps.mr:
>> +    id: 0xc0011200
>> +    fields:
>> +      flags: {number: 1, flags: mr-device-caps}
>> +  evidence-get request:
>> +    id: 0x80020000
>> +    fields:
>> +      challenge: {number: 1, type: binary, min-length: 1, max-length: 4K,
>> +                  optional: true}
>> +      objects: {number: 2, record: evidence-get objects, max-occurrences: 16}
>> +  evidence-get objects:
>> +    id: 0x80021000
>> +    fields:
>> +      id: {number: 1, type: uint, max: 15}
>> +      data: {number: 2, blob: output, backings: [va], max-length: u32-max}
>> +  evidence-get reply:
>> +    id: 0xc0020000
>> +    fields:
>> +      results: {number: 1, record: evidence-get results, max-occurrences: 16}
>> +    members: ['record mr-generation?']
>> +  evidence-get results:
>> +    id: 0xc0021000
>> +    fields:
>> +      format: {number: 1, enum: evidence-format, optional: true}
>> +      vendor-format: {number: 2, enum: evidence-vendor-format, optional: true}
>> +      length: {number: 3, type: uint}
>> +  mr-get request:
>> +    id: 0x80030000
>> +    fields:
>> +      id: {number: 1, type: uint, max: u32-max, optional: true}
>> +  mr-get reply:
>> +    id: 0xc0030000
>> +    fields:
>> +      items: {number: 1, record: mr-get items, max-occurrences: unlimited}
>> +  mr-get items:
>> +    id: 0xc0031000
>> +    fields:
>> +      id: {number: 1, type: uint, max: u32-max}
>> +    members: [$include mr-desc]
>> +  mr-read request:
>> +    id: 0x80040000
>> +    fields:
>> +      id: {number: 1, type: uint, max: u32-max}
>> +  mr-read reply:
>> +    id: 0xc0040000
>> +    members: [record mr-generation, record mr-values]
>> +  mr-extend request:
>> +    id: 0x80050000
>> +    fields:
>> +      id: {number: 1, type: uint, max: u32-max}
>> +    members: [record mr-values]
>> +  mr-extend reply:
>> +    id: 0xc0050000
>> +    members: [record mr-generation]
>> +extensions: {device-info: 1}
>> +enum-extensions: {evidence-vendor-format: 1}
>> +ops:
>> +  device-get: {id: 1, type: action, fd-access: read,
>> +               request: device-get request, reply: device-get reply}
>> +  evidence-get: {id: 2, type: action, availability: dynamic, optional: true,
>> +                 request: evidence-get request, reply: evidence-get reply}
>> +  mr-get: {id: 3, type: query, fd-access: read, optional: true,
>> +           request: mr-get request, reply: mr-get reply}
>> +  mr-read: {id: 4, type: query, fd-access: read, optional: true,
>> +            request: mr-read request, reply: mr-read reply}
>> +  mr-extend: {id: 5, type: action, optional: true, request: mr-extend request,
>> +              reply: mr-extend reply}
>> diff --git a/Documentation/ctlv/abi/families.registry.yaml b/Documentation/ctlv/abi/families.registry.yaml
>> index 5845e745777150..7a5c6af2956578 100644
>> --- a/Documentation/ctlv/abi/families.registry.yaml
>> +++ b/Documentation/ctlv/abi/families.registry.yaml
>> @@ -5,3 +5,4 @@
>>  # Written by "make -C tools/ctlv regen".
>>  families:
>>    - ctlv
>> +  - ctlv-attestation
>> diff --git a/Documentation/ctlv/families.yaml b/Documentation/ctlv/families.yaml
>> index 4d219d7af74a79..dbb0243b873d68 100644
>> --- a/Documentation/ctlv/families.yaml
>> +++ b/Documentation/ctlv/families.yaml
>> @@ -15,3 +15,4 @@
>>  
>>  families:
>>    - ctlv
>> +  - ctlv-attestation
>> diff --git a/Documentation/ctlv/generated-files.yaml b/Documentation/ctlv/generated-files.yaml
>> index d4766b176ceb98..00a56634805d40 100644
>> --- a/Documentation/ctlv/generated-files.yaml
>> +++ b/Documentation/ctlv/generated-files.yaml
>> @@ -16,3 +16,10 @@ families:
>>        kernel-header: include/linux/ctlv_gen.h
>>        kernel-source: lib/ctlv/ctlv_gen.c
>>        user-source: tools/ctlv/libctlv/ctlv_user_gen.c
>> +
>> +  - name: ctlv-attestation
>> +    source: Documentation/ctlv/specs/ctlv-attestation.yaml
>> +    outputs:
>> +      uapi-header: include/uapi/ctlv/ctlv_attestation_gen.h
>> +      kernel-header: drivers/attestation/generated/ctlv_attestation_gen.h
>> +      kernel-source: drivers/attestation/generated/ctlv_attestation_gen.c
>> diff --git a/Documentation/ctlv/specs/ctlv-attestation.yaml b/Documentation/ctlv/specs/ctlv-attestation.yaml
>> new file mode 100644
>> index 00000000000000..78b2dad6318a6f
>> --- /dev/null
>> +++ b/Documentation/ctlv/specs/ctlv-attestation.yaml
>> @@ -0,0 +1,181 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Attestation devices: evidence and measurement registers (MRs). The device's
>> +# family inherits this one, fills device-info and gives evidence-vendor-format
>> +# the formats its vendor defines.
>> +family: ctlv-attestation
>> +inherits: ctlv
>
>This is much easier to read, I think it works well like this!

Yeah, pretty happy with it as well. Thanks for the suggestion!


>
>> +
>> +enums:
>> +  # What an evidence object is.
>> +  evidence-class:
>> +    # Made by evidence-get over its challenge, and signed by the root of
>> +    # trust.
>> +    - signed
>> +    # The platform's log of what firmware and the boot chain measured into
>> +    # the MRs. Later extends, through mr-extend or otherwise, are not in it.
>> +    - event-log
>> +  # A layout of an evidence object that a standard defines.
>> +  evidence-format:
>> +    # The log area of an ACPI CCEL table, a TCG crypto-agile event log.
>> +    - ccel
>
>Lets be in the habit of including a detailed spec reference for things
>that are standards.

Agreed. Will add it.


>
>> +  # A layout of an evidence object that one vendor defines, given by the
>> +  # device's family.
>> +  evidence-vendor-format: extension
>
>I find this 'standard' 'vendor' distinction confusing. Is this an
>artifact of the compilation process?
>
>This would be more usable if there was one enum but both this yaml and
>the driver yaml can contribute values to it. If we made an 'extendable
>enum' then the values could be full 64 bit ID numbers with the tree
>coding so that the extension works the same way as a op and record?
>
>Though I'm a bit nervous about what happens if something in a driver
>turns into a standard. It would be nice to be able to make the
>driver's ID promoted to a global ID without changing the ID. That
>sounds like something the generator could learn to do later I guess.

I see your point. Bit if we have 64bit enum value what included the
family id, we still have per-family namespace of enum values. Hard to
"promote to global id". We would have to have one range of enum values,
some of which would be driver, some global. How exactly you see this
happening?


>
>The comment should be improved to define what consitutes a 'format'. I
>was advocating that the format should define enough to check the
>signature and the challenge universally.
>
>Like Peter described the new TDX evidence as "tdx-quote-eat-cwt-1.0".
>
>Poking at the IETF RFCs with AI a bit I think it should be described
>as "CWT EAT" in this language. The EAT RFC defines the location of the
>challenge and uses the CWT packaging which defines how the signature
>is placed.
>
>I think ARM uses this format too, IDK what AMD uses.
>
>The EAT itself should have information inside that describes the
>"tdx-quote-1.0" idea, so we don't need it externally.

Perhaps we need 2 attributes, "evidence-packaging" and
"evidence-format"? This is a bit unclear to me to be honest.


>
>> +  # The kernel's hash algorithms.
>> +  hash-algo:
>> +    $header: linux/hash_info.h
>> +    $enum: hash_algo
>> +    $end: HASH_ALGO__LAST
>> +
>> +flags:
>> +  # What a device offers for its MRs.
>> +  mr-device-caps:
>> +    # mr-extend is provided.
>> +    - extend
>
>I guessed the userspace should learn what operations are supported
>using introspection directly on the operation? Do we need to specify
>what ops are implemented in device-get?

True, will remove this leftover.


>
>> [ ... 5 lines skipped ... ]
>> +records:
>> +  # One MR, as mr-get describes it.
>> +  mr-desc:
>> +    # The platform's name for the MR, such as rtmr0.
>> +    name: string(1..128)
>> +    # Its banks, each once, in the provider's order.
>> +    supported-hash-algorithms[hash-algo]: hash-algo
>
>I wonder if it would be wise to put a bit more syntax here:
>    supported-hash-algorithms[num_entries(hash-algo)]: hash-algo
>
>Just to be clear about exactly what is being extracted from
>hash_algo.. It is the total number of entries, not the maximum value
>or something else.

I already have this changed in my work tree as:
"supported-hash-algorithms[enum hash-algo]: enum hash-algo". I think it
is enough, what do you think?

[...]
