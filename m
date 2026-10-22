Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683512;
	b=bjuvCQArvnRVczJ/fkRiDGNDMtfRlCsik8WNFI6R8z24L2dfO6vzpg/enM4YnDIKARSz
	 JF2MzvEQmYG3OoNKe8IoxtQOimHOr4AOCDlPWsd0b+2+5vIEjcvEPLfNQnMLZoflK9F/P
	 A5IDQXYvVn4uCVAHS+levmvPKNY+8eO47x23JNSv/ZMYcXxyHQYQnr++y09yfQ/2PARKl
	 9M57qjxtiRH01dXi/6eCpeAFfpinkt0teVGD3Dn689XyXvnyGTb3jg5L66zi5ETLj8w7c
	 MrLUozUcejN6mxxanQ95A5s2eQZx30cJB9igHQt8I/3vcc8XZYeaSGO2tOC5LzPl+hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=THWbJhv2Q5jbET1QHUfSXWDLSqDqi0mWlN0MWSjDZMo=;
	b=dHHDCHLyaKTdwY1YctglDNJxYpNiEmhs5fTSO0RKGg7qG5zlJ//vVFOB9LiLMGFC5lNL
	 RqGH2E2nRwTQi2FBNAbhVAEmOFlrBhSWEv/cP+4FmOeOq/zHNwl8TvFED1GQb7Yp/n8ZI
	 GH7QkVGsdvkS3i9zxJPkf2EVv43kKy6LWxwyNDYlySFstalkZrPAZfV+8xw1sXg4MN6FV
	 1CoiBu7rThApL5s2n9aBkwUlVEPGr1qYcGxsyUPgaHi6a916MLk0iAbVLkIPRup3mX0Wc
	 67/EKtWNFuYaJM1UfZRUbpp2FmzjF6qPO5gSLR2RTjp/gMkwCdgbZcxEXzz54O1RN/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=k3f3S4Q7;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9390606A31E
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 15:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9390606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=k3f3S4Q7
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso13590255e9.2
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792683509; x=1793288309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THWbJhv2Q5jbET1QHUfSXWDLSqDqi0mWlN0MWSjDZMo=;
        b=k3f3S4Q7MgiWeNBSHKpBVn79v4g/2/kmnNdDLW+GyIzlrvsGVzJ4c8IOMSkX2v9BUS
         30jSZUR9E869GCLI7DSynJFK8z7P4UWajTV6dVU1YmVYsjF9QqdRohlZ5FVG0GS2kXiJ
         adJ631ZLe2/lkzHgdYMXa2/Ecti8pGxkzkH1/hudxqnqdbPwT2kCM28kzvcT1x2YuPjq
         HeabtGRxnXQgpNxwXZRvd0CsAlYFb5s99jG+iPOOJtGn/wco+9TWIyjc4btbBi0hwrdK
         sb/e0Z9VrP29AQ6Q9LsWslvPrMW0jRG6t9RwqNlOuLUPCbPK7dWuOVNiLB/c6HQUO8mk
         0R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683509; x=1793288309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THWbJhv2Q5jbET1QHUfSXWDLSqDqi0mWlN0MWSjDZMo=;
        b=WtHfiWKrUntUms3JVRigwBMb5SPcKmr5uXCMvBWn5Dqn0dE03tWopyKz54TDF91yfW
         SRiuCyeznToA6lmvnmZlzsaFzw2h3TbgctL0S2Q9gqBld/WtC6aKaiU05Lqr2o6JDjsq
         /l6GG3dldH1iWByvtsKDQHqAN2VQAy0ChNEZTDpjix4SXXzSzInw1PGpsSP1ZpewfI8L
         Wm9dw2c09USuNXfWCz2C4DHMxAApiDjgcR3m+7XPVt5xwctme3o6y0qtUGExMYOJuNMs
         bmTw0PGyb5vrXWua/GfuYV6J5NBCpsDCUN0lBj/IprNyWN0er197krkqMP+j8mXuQOWY
         74OA==
X-Gm-Message-State: AFq9FYL0ANrFy52vo0iLjA/Btq6Odax8xLCdBz1qr8Rz14zmMCPGKdRn
	pvwG614UCRiRpzbCZI7q7R4U5ii8ioYMaMDrqBYKsof+QM3TNfbTJvk9mAvE6AJJ5R0=
X-Gm-Gg: AYBFou327dC5EG/I5JKJk/Y1o9LYNJtaRys2BXQDt8jckXu/ToEsgQ4ytTjH5KeMe3Y
	cDvUJg18ove742hGG2b4EF32zXK6zOxS7BJ0Wy0AZMTSV7BeBxdB2+FqA+tqUsz+GNCJlH5+nRp
	102BbOQ7nKEpIpYUzq/TEYU0A9LI8aelJJgoumaM1G9Ycsw4utjQu4Qi3/M2hdfDirb/NzEfIge
	8U+Li5dmCySvuU+nvNnkidlQ/ldRtpXJMovWgZVajiCEfHWuJVOfAliLgadW89CHoXGzQcEP7ZJ
	F9g7pR4JzXwApeUE6LhEx3Vu5eyEMZwlme1ofJwtnktJSKeO2lq/+UrxdxF2nWyynlFJkSk7u47
	3VJ3/kw/0F9GVIbMRYQ4FNly8Kjx4EFIixTzxZhqKDwV+J1FOODFHD3nWxil22z7t6gOUh70eGm
	ofEffzvZ5igJMrvHu9WXofbmQTnCbv9PcBGaQDiZtS2yCZFCCmnzSNjdZXrwY8yAbveFLOV0NT9
	z5mlR9sbUU4pA18fVdblIDjiVSriRRj4RkLgdvsrSHQ61i/e5ZoMHi2AW+KtMdHbEU=
X-Received: by 2002:a05:600d:6413:20b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a1fdd20c95mr82878645e9.6.1792683507910;
        Thu, 22 Oct 2026 08:38:27 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2a034fc2sm8929342f8f.5.2026.10.22.08.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:38:27 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:38:22 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atooh7uO2RauUTfY@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
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
In-Reply-To: <yq5a7bjajaco.fsf@kernel.org>

Thu, Oct 22, 2026 at 12:30:47PM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Linux has several attestation interfaces tied to individual technologies.
>> That makes evidence retrieval, measurement registers, device state and
>> kernel consumers provider-specific.
>>
>> This series introduces a common attestation subsystem. Its goal is to
>> support platform, TEE and device providers through one model, including
>> TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices.
>> This first series implements the common subsystem and a TDX provider.
>> Existing native TDX tsm_mr and tsm_report interfaces remain independent.
>>
>> Attestation devices use CTLV, a schema-driven character-device TLV UAPI.
>> Compared with sysfs or configfs, CTLV executes one validated request
>> atomically instead of assembling a transaction through several files.
>> Compared with netlink, an opened device fd directly identifies authority
>> and lifetime, can be delegated normally, and owns its event queue. CTLV
>> also provides:
>>
>>   - generated kernel metadata, UAPI constants and documentation;
>>   - strict type, bounds, nesting and required-field validation;
>>   - runtime operation and schema introspection;
>>   - family inheritance and extension points;
>>   - fragmented queries with generation checks;
>>   - per-fd event subscription, overflow reporting and removal notification;
>>   - large input and output blobs.
>>
>> The attestation family exposes capabilities, evidence, measurement-register
>> topology and operations, an append-only MR journal and journal
>> notifications. This first ABI contains the paths exercised by TDX. Extended
>> evidence classes, dynamic registers, record payloads, verdict recording and
>> device-security transitions follow with providers that need them and are out
>> of scope of this initial patchset. The broader direction is illustrated here:
>>
>> https://github.com/jpirko/linux_mlxsw/commits/wip_attestation_all_1
>>
>> That branch also contains additional providers (test and sim),
>> attestation core extensions, libctlv and ctlvctl. With the tools
>> and kernel specifications, an attestation device can be used as follows:
>>
>>   # Discover CTLV devices and their family chains.
>>   ctlvctl --spec-dir Documentation/ctlv/specs list
>>
>>   # Inspect the root-family lineage and attestation capabilities.
>>   ctlvctl --spec-dir Documentation/ctlv/specs query ctlv0 families-dump
>>   ctlvctl --spec-dir Documentation/ctlv/specs query ctlv0 device-get
>>
>>   # List the measurement registers of the attestation device.
>>   ctlvctl --spec-dir Documentation/ctlv/specs query ctlv0 mr-dump
>>
>>   # Read RTMR0 (MR 1).
>>   ctlvctl --spec-dir Documentation/ctlv/specs \
>>           query ctlv0 mr-read mr.id=1
>>
>>   # Extend RTMR0 with 48 zero bytes (SHA-384).
>>   digest=$(printf '%096d' 0)
>>   ctlvctl --spec-dir Documentation/ctlv/specs \
>>           exec ctlv0 mr-extend --json \
>>           '{"id":1,"value":[{"hash-algo":5,"data":"hex:'"$digest"'"}]}'
>>
>>   # Retrieve the RTMR0 journal.
>>   ctlvctl --spec-dir Documentation/ctlv/specs \
>>           query ctlv0 mr-log-get --json '{"selection":[{"id":1}]}'
>>
>> The 20 patches are organized as follows:
>>
>>   1-13    add CTLV, its generator and documentation
>>   14-17   add the base attestation family and implementation
>>   18-20   expose the native TDX service and add the TDX family
>>
>
>I am using this to understand what the IDE setup flow would look like,
>but it is unclear whether the connect flow belongs in an attestation
>framework. I understand the desire to pass the certificate slot number
>as part of connect, and sysfs is probably not a suitable interface for
>that. However, is CTLV the interface we want to use for connect?

I was thinking about this and "connect" really does not belong in the
attestation CTLV (same applies to "lock"). I was thinking about some
parallel PCITSM CTLV instance, but that does not really click as well.

Currently I'm thinking we can maintain existing "connect" in sysfs and
extend it with "lock" sysfs knob for Realm side. Both would create
ctlv-attestation-spdm instance. The same spdm instance may be created
for other non-PCI-backed device.

The proposed host flow is:

    sysfs connect: select tsmN and prepare the connection
        -> negotiate SPDM and discover certificates
        -> register ctlv-attestation-spdm instance in DISCOVERED state

    SPDM_GET
        -> populated certificate slots and digests

    EVIDENCE_GET(CERT_CHAIN, blob-instance=slot) /*optional*/
        -> retrieve candidate certificate chain for appraisal

    SPDM_AUTHENTICATE(device-generation, spdm-slot=selected_slot)
        -> authenticate the selected chain
        -> complete backend-required session and IDE setup

    sysfs disconnect
        -> remove the attestation instance
        -> destroy the native connection

The slot is therefore selected after discovery, rather than supplied to
connect. The attestation instance represents the prepared connection; it
does not exist beforehand as a controller for a disconnected PCI function.

This requires a staged native backend. It is not how existing automatic
sysfs connect behaves today, and those backends would retain their
existing behavior.

For Realm assignment, as written above lock is sysfs interface.
Lock creates a separate assigned-TDI attestation instance for evidence
retrieval, EVIDENCE_ACCEPT, and DEVSEC_RUN

Protocol authentication is distinct from the userspace attestation
verdict: SPDM_AUTHENTICATE does not imply acceptance or TDISP RUN.

So the main difference from your implementation is the lifecycle boundary:
sysfs creates/removes the native contexts, while attestation handles
discovery, explicit authentication, evidence, and the evidence-gated
transition to RUN.

Makes sense?

>
>My patches end up doing the following. I am also unsure whether this is
>the intended workflow for the attestation framework.
>
># ./ctlvctl/ctlvctl --spec-dir=./specs/ ops ctlv0
># ctlv/ctlv-attestation/ctlv-attestation-pci, generation 1
>families-dump           query   read    fixed   request 16      reply 112..65536
>ops-dump                query   read    fixed   request 16      reply 56..65536
>op-schema-get           query   read    fixed   request 40      reply 552..65536
>subscriptions-add       action  read    fixed   request 6160
>subscriptions-remove    action  read    fixed   request 6160
>event-queue-get         query   read    fixed   request 16      reply 40..65536
>event-queue-set         action  read    fixed   request 40
>op-changed              event   record 112
>event-overflow          event   record 112
>device-removed          event   record 40
>device-get              action  read    fixed   request 16      reply 12984
>evidence-get            action  read-write      dynamic disabled        request 26800   reply 472
>device-state-changed    event   record 64
>mr-log-entry-appended   event   record 73416
>evidence-accept         action  read-write      dynamic disabled        request 64
>evidence-accept-clear   action  read-write      dynamic disabled        request 16
>devsec-state-get        query   read    dynamic disabled        request 16      reply 40..1024
>devsec-run              action  read-write      dynamic disabled        request 64      reply 40
>evidence-state-changed  event   record 112
>state-get               action  read    fixed   request 16      reply 184
>connect                 action  read-write      dynamic enabled request 88      reply 40
>disconnect              action  read-write      dynamic disabled        request 40      reply 40
>lock                    action  read-write      dynamic disabled        request 64      reply 40
>unlock                  action  read-write      dynamic disabled        request 40      reply 40
>evidence-refresh        action  read-write      dynamic disabled        request 88      reply 40
>
># ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 state-get
># state-get, 1 fragment, generation 0
>  pci.generation 0
>  pci.connected 0
>  pci.locked 0
>  pci.accepted 0
># 
>
># ./ctlvctl/ctlvctl --spec-dir=./specs/ schema ctlv0 connect                
>connect (action)
>request:
>  root nest
>    pci.generation required uint [0, 4294967295]
>    pci.tsm-id required uint [0, 2147483647]
>    pci.cert-slot optional uint [0, 7]
>reply:
>  root nest
>    pci.generation required uint [0, 4294967295]
># 
>
># ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 connect pci.generation=0 pci.tsm-id=0
>
>-aneesh
