Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505235;
	b=ftOHTlmXoyFvDWU4P5rXhxUIrYBwnhZydmeqsn5wmuvlgpC896vhDl9BmDfnAmr6i49r
	 ZwgAPfw19FUyzyRVyKRZyQZtoKGmTmVwV0fZP3Xe866aVsQDKcoS28danNBzka7J5z7Ov
	 zsRT71TzKs0q/zIRZldFG/K7eC0E9q+1W+GUJcKKTpq9YUar0rZanHP9WuzmguQL+6TVj
	 tX+3D6UA+rYO3OBy0EM70Y0c13uSZGBbZyH742yhDZcR0bkDXb9he5UDu2AZ7M/1kB3sL
	 9oDs9siv1Dx8ZF2l7Cfrj7QY7tw4oJ+bI8qRA1MkKf4NYAbPwmRJxGwrYrKZo1L3QDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4gjHPXmCn70UaULysoVyHSyhywjis8FMubgn3n0iN+w=;
	b=KyRP4OYro/NA/LcgpZOzdoCT05BtbqAtvzy9EJtoUZ5JW0dnolXpgkuryozdjsmczdsg
	 O1ltW+D9lBygpfXeveRGwGdcNPuMgZoh2F/qW821+CrBVYjmGwm+Z5fTPr2LCfcxwH440
	 b0msm9n1YWmdG1D+22sdQ5cFfd5+W7dxfl70BVba1/GqudLhf735um8ly7OiePwE2FdHl
	 Ov18oBWsRmYoy9mjpd5UCUDInAcSOtY5vGDzF83UjcnPSoWxwULTSo5UZnuJ7v0NrAA2c
	 5S6bNpQe/XZg7OJ8rtFxDbmq2Srd9iAZ7iuCK757Uzt2ea3ce5dc9/6rIGVtbzHXrtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hHUwa6jF;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8F606A327
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 14:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE8F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hHUwa6jF
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2117091f8f.3
        for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792505225; x=1793110025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4gjHPXmCn70UaULysoVyHSyhywjis8FMubgn3n0iN+w=;
        b=hHUwa6jF6H1u4WYma2EelToonyH7oz1U+IPH1ORXLJIkklgA9wMVLWyX0bcEIpg4vc
         6SW5sqgoEvovBGF1didBi+3upf4d3Z8sYJ/Z1SSEltspM+hkuJ8WiPwRMUDDoYezf/US
         2xRL7kPU9lPZ12cOPyd8aNiSpmDZ+yND7r8PMPiYZcSJOHECYKIAS9tCVHiF009RDBln
         sa6UJCLd3H6TqHxtS7/FlF3K8jV3mT+3n+gDb7aoY+uD6JgMFXf0kMCDTIV8dwL9goEp
         EZ5Fcjwgjrxbpi3Nt+p01c90q0hwaTQqJE/CQT7kcte7J9ey0XUT9pPCg/4omEd3mjCK
         xn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505225; x=1793110025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gjHPXmCn70UaULysoVyHSyhywjis8FMubgn3n0iN+w=;
        b=1j94Fs4rU1eh1LjWgPS9uejOceC+3SrQ29Obxi+LM5+dndwFZfN561fX8bawARSDNm
         PdTtJA/ySQohzwN90gRyA6dKd38SbIH4uPmsZvTV+mY8K/hnjt3wsyJfbNY4E1VYAzYd
         ehHgopZibahXZG8mmQWjkRtyPqHOiMC50VuQbSW6nFJpWKQDnUburYY2FiwAzpTgZayZ
         HbthLJFqWWmGEVRZOrcAXYPOB2HCBn3VO1IV9Uo3/24JtR4KIjgiBszVhCRIS1SgKCGR
         UWHkFxom7gGvElW77Pozr7gyq75mhLXFX1OdwN0FFGhIv7xmMGwNpN7BR8E6fROo0cgG
         sFhA==
X-Gm-Message-State: AFq9FYJsjLajj97l9fE68LYTszG6GnNUtxv1ocPUPzWDZXpo+SyuCCDv
	YQyHOh2QRjG/Unh0bHGIpgDcHysrVB4zGAobNLFwglpovLc8+pPZK1BP+v/KXEQA+9s=
X-Gm-Gg: AYBFou3ziyWikw91eLItMb/89VZE/cV+FF7bfygavKDgwANPIpw+NWcsFicfHH4WIC6
	RzdNMYRlS3WvNnuxwCIxTQrFmZ7FPI9NhFHw4tDA/nEdOyTFKjnmXh7/oksY6dqfPoUqbLFs1fz
	k2Uqbrb3QOyR/hKX9yR4nCiieyVsICie6BF+H9V4IjLGHsKuzmahk73+jOrwzPSAmcK9nvaq5qY
	SHF1RTXkCi4/5X4oU2t/l5k8mh7CWS5meiJSdMPcIon0on7orwL3uWuOXVTc3WtaJMZUdzGWTRo
	7ocwauP3lsFHFviWEav/Q7aJzR6kYwWINvh6/0k7BNvmI5oYrRp2XsgwsRdjCEkRrzYKpLvQe0a
	hSiqDwX0ONhkfS38QPqpofEn7m9eN0heXb0CCwWEm4uOYgsXNgQpn3Ah5aaKqlAFlbjFvmvmV/8
	AzLPiKaHTYqolrh9X7wA13u5abj0VIblz7QvkJLjjyF7JVGBZQVQb4lwD7HKjRkRkUsA+FlevrB
	XabptIwV//cm7I=
X-Received: by 2002:a05:6000:490f:b0:48b:9d80:53a5 with SMTP id ffacd0b85a97d-48e07bbe5d5mr22481939f8f.10.1792505222787;
        Tue, 20 Oct 2026 07:07:02 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214b5sm6798703f8f.41.2026.10.20.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:02 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:06:58 +0200
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
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 04/20] Documentation: ctlv: Add userspace ABI
Message-ID: <atdjqGI1GvONVJuK@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-5-jiri@resnulli.us>
 <179245258505.58760.6612247594755628055.b4-review@b4>
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
In-Reply-To: <179245258505.58760.6612247594755628055.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> Describe the CTLV transport, discovery, wire format and userspace
>> compatibility rules.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  Documentation/userspace-api/ctlv.rst  | 507 ++++++++++++++++++++++++++
>>  Documentation/userspace-api/index.rst |   1 +
>>  MAINTAINERS                           |   1 +
>>  3 files changed, 509 insertions(+)
>>  create mode 100644 Documentation/userspace-api/ctlv.rst
>>
>> diff --git a/Documentation/userspace-api/ctlv.rst b/Documentation/userspace-api/ctlv.rst
>> new file mode 100644
>> index 00000000000000..5ebca3d4d94af8
>> --- /dev/null
>> +++ b/Documentation/userspace-api/ctlv.rst
>> @@ -0,0 +1,507 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +==================
>> +CTLV userspace ABI
>> +==================
>> +
>> +:Author: Jiri Pirko
>> +
>
>This could use an introduction:
>
>Char-Device Tag Length Value (CTLV) is a flexible way to describe system calls
>delivered over ioctl for a kernel subsystem. It provides a 64 bit operation
>number with variable length input/output arguments described in a YAML schema.
>The arguments are serialized using a TLV scheme. Strong support for
>forwards/backward compatability is baked into the schema design.
>
>CTLV excels for uAPIs that are too unconstrained to fit in simple structs.
>Things that have arrays of arrays, variable size structs, variable sized data,
>strings and similar which are challenging to represent.
>
>As a transport CTLV uses a global number space. Inspection tools like
>strace/seccomp can always decode a CTLV ioctl without having to know what
>subsystem is using it. The global number space is organized into families, which
>roughly corresponds to a subsystem.
>
>A family describes what its devices accept in YAML, a generator turns that into
>kernel metadata and UAPI headers, and CTLV validates every message before a
>family callback sees it. Userspace sees one character device per instance, one
>ioctl, and ``read()`` for events.

okay, looks great.


>
>> +CTLV is a transport for device control interfaces. A family describes what its
>> +devices accept in YAML, a generator turns that into kernel metadata and UAPI
>> +headers, and CTLV validates every message before a family callback sees it.
>> +Userspace sees one character device per instance, one ioctl, and ``read()`` for
>> +events.
>> +
>> +This document is the ABI. What each family accepts is specified under
>> +``Documentation/ctlv/specs``; writing a family is :doc:`/driver-api/ctlv`.
>> +
>> +Why a TLV transport
>> +===================
>> +
>> +CTLV puts the rules of every operation in one description and validates them
>> +once:
>> +
>> +- One ioctl carries every operation of every family, so a new operation is a
>> +  new specification entry, not a new ioctl number.
>> +- Attributes are optional or required by declaration, so a message can grow
>> +  without breaking a caller that does not know the new attribute.
>> +- An unknown attribute is refused on a request and tolerated on a reply, so a
>> +  new kernel can say more to an old program. A request may mark an attribute an
>> +  old kernel is welcome to skip, so a new program can say more too.
>> +- Bounds, lengths, occurrence counts and nesting depth are checked before a
>> +  family callback runs.
>> +
>> +Devices
>> +=======
>> +
>> +Each registered instance appears as a character device in the ``ctlv`` class
>> +with a dynamic minor::
>> +
>> +    /dev/ctlv0
>> +    /sys/class/ctlv/ctlv0
>> +
>> +Sysfs shows class membership, the ``dev`` number and the device-model link to
>> +the parent device. There is no family sysfs attribute; ``families-dump`` on an
>> +open descriptor is the authoritative answer to what a device is.
>
>I've tried to like this but, I really am not a fan. I think it
>reflects too much of a netlink influence.

Well, yes and no. In contrast with Generic Netlink, CTLV builds on
inheritance. So *every* CTLV family is child of "root" CTLV family. So
if user opens any /dev/ctlvX, the "root" CTLV family ops work. Then the
families-dump op reveals the inheritance chain from root to the leaf.
The idea is to allow generic tool to work on upper family level and
allowing some driver-specific tool to work on the leaf.
Think of it as a part of introspection of a device.


>
>My two biggest problems:
>
>1) This prevents us from incrementally using CTLV as a more robust
>   uAPI. Like if I wanted to start using it in vfio for new uAPI I
>   cannot

I don't think that the existance of family-dump prevents you that. I
have idea of a split that would allow you to attach CTVL ioctl on
existing fd. Will try to sketch it and implement it.


>
>2) It destroys the kernel concept of a cdev subsystem, where we have a
>   distinct class, /dev/ directory and cdev nodes.
>
>   Lots of tooling and userspace is geared toward working this way. A
>   completely unstable /dev/ctlvX that could be *anything* will need a
>   meaningful new methodology in userspace. For instance anyone doing
>   containers that wants to pass these is going to need special
>   tooling.

The node is not opaque before open, though. It is a device-model child
of the device that registered it, so /sys/class/ctlv/ctlv0/device
points at that parent, and its uevents carry the family and its
ancestry (CTLV_FAMILY, CTLV_COMPATIBLE_*).

udev can name it from the same properties. ctlv0 is no more stable
than sda or event3, and it gets a stable name the same way: a rule
matches the family or the parent and adds a symlink, as /dev/disk/by-id
does for disks, e.g.:

    SUBSYSTEM=="ctlv", ENV{CTLV_FAMILY}=="ctlv-attestation-tdx", \
        SYMLINK+="attestation/tdx"

A container is then given /dev/attestation/tdx rather than whichever
ctlvN it happened to get; no special tooling is involved. The Discovery
section later in the doc has the details.


>
>> [ ... 143 lines skipped ... ]
>> +An attribute ID names the family that declared it, a group within that family
>> +and an attribute within that group::
>> +
>> +    63           48 47           32 31                             0
>> +    +--------------+--------------+--------------------------------+
>> +    |    family    |    group     |             attr               |
>> +    +--------------+--------------+--------------------------------+
>> +
>> +    CTLV_ATTR(family, group, attr)
>> +    CTLV_ATTR_FAMILY(attr) / CTLV_ATTR_GROUP(attr) / CTLV_ATTR_NUMBER(attr)
>> +
>> +An operation ID is the same shape with the group bits zero::
>> +
>> +    CTLV_OP(family, op)
>> +    CTLV_OP_FAMILY(op) / CTLV_OP_NUMBER(op)
>> +
>> +Use generated complete IDs. A family's header defines every ID it declares
>> +and includes its parent's.
>
>I'm OK with this, it seems like a fine design, very netlink inspired.

Netlink actually does not have it. Attr id is not global as it is here.


>
>One of the nice properties is an external tool, like strace or a
>seccomp does have enough information to capture the entire operation,
>including all parameters.
>
>Though I wonder how much trouble it will be for userspace to form
>these things.. It has to pre-determine how much memory it needs then
>fill in this structure. That's not so easy to use.
>
>How hard would it be to accept a linked list, or array, of buffer
>frags? With some strict rule that a leaf attribute cannot span frags?
>
>My thinking is userspace could allocate frag by frag as it builds the
>message instead of being forced to do a size, allocate, fill sequence?

There are no frags on the request side (reply has them).
The entire message is a single buf. For request, all arrays are bounded
and this is enforced for every family attribute. The introspection
provides kernel-computed max size of buffer for ever op request.
Then during processing, kernel copies the whole request buffer before it
parses it.

I deliberatelly made this limitation to keeps things simple. Makes
sense?


>
>> +
>> +Request occurrence order
>> +------------------------
>> +
>> +Occurrences of one attribute ID must be contiguous within each request root or
>> +nest. ``A A B`` is valid, while ``A B A`` is not. An ignored unknown attribute
>> +is not an occurrence of any known attribute, but it ends the preceding run, so
>> +``A ignored-unknown A`` is also invalid. Different IDs otherwise have no
>> +required numeric or schema order.
>
>I'm not entirely sure what this is trying to say. Is it just a single
>ID must be contiguous if it is repeated?

Yes it is a limitation of ordering of attributes that occur multiple
times in message/nest (arrays). Will reword.


>
>> +
>> +Attributes a kernel may skip
>> +----------------------------
>> +
>> +A request attribute, the root aside, may carry
>> +``CTLV_ATTR_F_IGNORE_IF_UNKNOWN``. If no family the device answers declares
>> +that complete ID, the kernel steps over the whole attribute without looking
>> +inside it; without the bit, an attribute the schema does not place where it
>> +appears fails the request as it always has.
>> +
>> +The bit forgives an ID this kernel has never heard of and nothing else. An ID
>> +the device's schema declares somewhere is held to that schema, so an attribute
>> +sent where it does not belong fails whether the bit is set or not, and one sent
>> +where it does belong is checked as usual. Every other rule applies too: the
>> +length has to fit its nest and the header may carry no bit the format does not
>> +define. Replies and events never carry it.
>
>This is pretty hard to read. AI?

Okay, will reword.


>
>> +
>> +This is how a program built against a newer version of a family talks to an
>> +older kernel. What that kernel knows is validated, what it does not is
>> +ignored, and a caller that has to know which is which asks ``op-schema-get``
>> +first.
>> +
>> +Executing an operation
>> +======================
>> +
>> +One ioctl executes every operation::
>> +
>> +    struct ctlv_op_exec {
>> +            __aligned_u64 op_id;
>> +            __aligned_u64 request;      /* struct ctlv_attr __user * */
>> +            __aligned_u64 reply;        /* struct ctlv_attr __user * */
>> +            __u32 request_len;
>> +            __u32 reply_len;
>> +            __aligned_u64 generation;   /* queries only */
>> +            __aligned_u64 cursor;       /* queries only */
>> +            __aligned_u64 reserved[2];  /* must be zero */
>> +    };
>> +
>> +    #define CTLV_IOC_OP_EXEC _IOWR(0xBB, 0x00, struct ctlv_op_exec)
>
>Generally I've ben frowning on using the size arugment for ioctl. This
>means you can never make that struct bigger, and that's historically
>been a bad choice...
>
>I've mostly been using this:
>
>  #define IOMMU_DESTROY _IO(IOMMUFD_TYPE, IOMMUFD_CMD_DESTROY)
>
>And then put a length at the top of the struct and do the
>
>        ret = copy_struct_from_user(ucmd.cmd, op->size, ucmd.ubuffer,
>                                    ucmd.user_size);
>
>Kind of thing so there is a solid compatability story.

Okay, makes sense.


>
>> [ ... 81 lines skipped ... ]
>> +``ENOMEM``
>> +    The kernel could not allocate what the operation needed.
>> +
>
>EOVERFLOW for check_overflow failures

Okay.


Thanks!

>
>-- 
>Jason
