Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953670;
	b=uP5O47IkTfKMmmb+L1uwuVzMXjYjXlak2uZcCFVs9Nf7nWSRgOHSo4zmv9G8jUJaw1F6
	 /YGcJoosMfrBO7ncmYJrJK7EiB3rT7iPMdqFTV1P51vD/cnCaweYNKnTuWk562G+muprb
	 NZOMrn2kBET3vcZF2H8umscfEwu37cJ4J844gYmtIVBwainB93doY8cdBF5tRTOoJT7ib
	 YG+VadAEmblmlN0yLyo9EboTKtYs+DByOnUSJIdurULmUoqAAVoVIlNqozIoZvcwr9xlC
	 qNn29wDAOlU4hOMiogm+WH5w7Ql4l2n1KC17I+hF3fmHXbwbPrr1z72SH8DVvcFtlBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eFyf1J2eCmzdcygEsnj9uuRDnIkV5nwpe7sUFMbcNPA=;
	b=mnxO7hyueYQ6/3S9IZoUL/fmsSTQ8argN3sBPs324/4GB+BUMdwl8LfQSkr27kkik37f
	 dQGjyonpgu8J3oF+hg1vvafhsU7lj/X+JBd/VKItIMp/DuYsUvqR8QSDtnh+N0BbazuVf
	 LLO/QFrZi6EpsLFOBRE3KDQO4B2K4jATVb44v0gKASUot+5i/IzaFQg7TLbIHNH08/WkM
	 WknntnWYWyzipvf3FbY9NoJFOTH7YbfVT3VL8kaNinjJ7DsXPQMNgCFQGkQbx3XS9HkB1
	 XlC0S1kEypdsenMCsV8RrRM1H+kemJrKqQ/HIrgQPVmLVksj5b5p6sjyn8Z+R3PczlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=m8QAQ5Zy;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A80606A330
	for <linux-coco@lists.linux.dev>; Fri,  6 Nov 2026 08:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A80606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=m8QAQ5Zy
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491aaed7565so203600f8f.2
        for <linux-coco@lists.linux.dev>; Fri, 06 Nov 2026 00:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793953668; x=1794558468; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFyf1J2eCmzdcygEsnj9uuRDnIkV5nwpe7sUFMbcNPA=;
        b=m8QAQ5ZysfH7ByYENVZhU+eXT0Rai1VyOTjUPnoRaxtKVZYXYbWuUD/3qNk5mX3+Mn
         fVn7fl2Vn9C6g8H6HWgLcdCbozLo70jUVQnkiFPybIjhuopDnN3tFju7/M7SHBZ2Xcyr
         RxoAjfpsa7hgOTWcxa0ezSULHrBUTKZ5+qzIqhCFAkGRSf232l7yNyUxO236CNIJ5UQl
         FSPLKTUx0sS6DJI6n8yX5wHqCvO4AOfzvTXrNVCoVOlR8i8jQi8wkkU0fKaOIby5TTSS
         o/ZE+iS7LAXNT9lsIm5T/P1FYhCXtrbM1UPN1OWKcbbbOKnTpRtau9wKSpkaSVf82B1s
         3gTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953668; x=1794558468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFyf1J2eCmzdcygEsnj9uuRDnIkV5nwpe7sUFMbcNPA=;
        b=reWy8Yr0U2dvitsZwCpiwZ2c0QD0WfmgR4wlojZmTaTdzz6hfJ2L6WYW+77GTk9hm+
         7kEGtRihKk82mJGS+qzPimJR6b/w4p0I8d2CMwmjY1pDEM3bnXWfbo5nYTMl6wjKWGSx
         zDd0W60a65yb/QEVxSlXGI7EkSS2j926XUC1DBJFqMN3rtRYPE/98qK2FM0XtwV0wz19
         HQiYUrEqU8bnd81IPkrWVzNw0g5zjH1/2tRHBcR6bTWvL0Y3mrfk9FxQlEjSkbbOhWxU
         3etrAbJbdYUO6qnyxWw1gCh1buUQepGitxcT9gaL1xlj/GZBfSqVpVKjBL4LAJXN4e9E
         X1kg==
X-Forwarded-Encrypted: i=1; AKwUvBz+bhac0WFgD4005nF5D1b5Dp3Z3OXxZQ/x6ox8ZriBxNdvoYC8YKa32FSH82/SF6EYB8nL8JdUjHEG@lists.linux.dev
X-Gm-Message-State: APuU4Z91lhc27nHsywdFsQ9vjCptO4r6gUw1C9IXQiSElq67OjRYXyTn
	veC8xe1FUopnJO40Fkdo2+tXfSqz9QPsDdCeosKUDtf8y8Bhca8+XzDrs9LWgBJUZyU=
X-Gm-Gg: AYBFou1ic/eTxgFhKb7B1kVlILJe4VD00y/GC3rnaw3Irp/C3JwIWRquoJb26ipiuE3
	LYGFW2Jn9HsuEFFpW8b9B7e5zNnyF6bsQ/Mbw4gFYnerKapuXlCiwycL0mX3PPxJd2/bM5HS4Gy
	FJTBJsB9fJKDla/HkzS2ObYd27g7B7EWVl76IZUP+D49qdez0lg6OuP4sk+jEUNoeHzuOiegGNs
	ZQO39B1gd5/LTpETcaby/e7fxvgRW53caTDxOgT1Dd9i0HXwhgb8oucXMqCTqCiV2NY+hP5qfOp
	TFWUJ6ttqP6uQMtdbyrkOnPMq+tjNbYez0V3RkvLRouh5osdOHOvifooSTuSRFRXfMjrMG8+jUD
	UmVeLvEduhOI5EzUWbxHFWjro+N6e/3Vlm5QHT6zDwGjdouQLvCIjndxnjaYbtUlVIPhXO9bGO1
	0WehsNBfemKurYQPduEakjWk4VOhZvjvJpocNbHCl7Pnc8P3cmPDRra1fOnKuOr3MKD+DCbIXya
	Swtr3ScqKK7+dRpm2rMzbEpjPCKfktB0a9X+oVSt9JlpWD4GNx6IRyTQ/dkKCIZDDk13BYRI93r
	/4rHFQPEvxdh3fU2p6aVLTHIre33z53BouSiqOJNJHh7K+B/mkErgqI8SgyM
X-Received: by 2002:a05:600c:3e0e:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4b6dfba908bmr27264855e9.24.1793953667539;
        Fri, 06 Nov 2026 00:27:47 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b73ee651b7sm16201965e9.0.2026.11.06.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:46 -0800 (PST)
Date: Fri, 6 Nov 2026 09:27:42 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, aneesh.kumar@kernel.org
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <auy7IM0_S2tv7EZX@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
 <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
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
In-Reply-To: <auyKE2sGqtfjk4v5@e129823.arm.com>

Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> [..snip..]
>> >> 
>> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> > +					       const struct ctlv_cursor *request,
>> >> > +					       struct attestation_evidence_request *decoded,
>> >> > +					       struct attestation_evidence_object_request **objects)
>> >> > +{
>> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> > +	u32 challenge_length;
>> >> > +
>> >> > +	decoded->challenge =
>> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> > +	decoded->challenge_length = challenge_length;
>> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> > +	    challenge_length > caps->max_challenge_length)
>> >> 
>> >> Hmm, I'm not sure whether this check is required for
>> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> 
>> >> for example, if the provider provides two evidence:
>> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> 
>> >> might challenge is reuiqred for generating the token
>> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> 
>> >> However, in case of eventlog, it wouldn't require challenge.
>> >> for example, TPM event log or CCEL event log.
>> >
>> >Right
>> >
>> >> Do we need some field on attestation_evidence_supported_object whether
>> >> it requires challenge or not and applies this sanity check per the object?
>> >> 
>> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> always.
>> >
>> >I wonder if we should have two interfaces here for signed and unsigned
>> >evidence? It would be clearer for userspace then when it needs to
>> >provide a challenge or not.
>> 
>> Isn't the challenge field provided/not-provided enough?
>> 
>> Currently on the introspection side, device-get op would provide
>> challenge-lengths array:
>> 
>>         evidence?:
>>           challenge-lengths[8]:
>>             length?: uint(..4096)
>>             min-length?: uint(..4096)
>>             max-length?: uint(..4096)
>>  	  objects[16]:
>>             blob-class: evidence-blob-class
>>             max-length: uint
>>             blob-instance?: uint(..u32-max)
>> 
>> I think it would make sense to have challenge-lengths array per object:
>> 
>>  	  objects[16]:
>>             blob-class: evidence-blob-class
>>             max-length: uint
>>             blob-instance?: uint(..u32-max)
>>             challenge-lengths[8]:
>>               length?: uint(..4096)
>>               min-length?: uint(..4096)
>>               max-length?: uint(..4096)
>> 
>> Then the unsigned object would just simply have challenge-lengths empty?
>
>This looks good to me. :)

The challenge is one of several open points that all depend on what an
evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
"primary", "raw" and the format strings. Here is my proposal to settle
these together:

The model:

1. device-get lists each object with an id, a class (signed, event-log,
   cert-chain or auxiliary), the formats it may come in, its max-length
   and, for signed objects only, challenge-lengths.
2. evidence-get names objects by id, as MR ops name MRs, each with its
   output blob. It carries a challenge exactly when it names a signed
   object, and the challenge has to fit each of them.
3. The reply gives each object's format, length and, where the TCB
   vouches for it, the TCB's digest. The output is always {label, data}.
4. A signed object is made by the call, over the challenge, and never
   reused. The rest are read as they stand.

This settles following issues discussed during this patchset review:

1. One op, not two. Per-object challenge-lengths tell userspace when to
   pass a challenge, and one call returns the signed object with the log
   and certificates needed to check it.
2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
   /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
3. TDX's Quote object lists the legacy and the DICE format. The provider
   labels what the host returned and fails on a Quote it cannot label.
4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
   spdm-measurements and tdisp-report become formats, and signature
   goes, as a signed object carries its own.
5. "raw" goes with the representation attr. The TCB digest is a reply
   field, so a blob always holds the object's own bytes.

Formats become an enum each provider family defines, instead of free
strings. I'm still unsure if format should be entirely provider-specific
and defined as "extension", or it should be somehow mixture of common
and provider-specific. Looks there is not really much common
anyway, so I lean towards provider-specific only. So far I have:

======  ============  ==========  =========  ===========================
Family  Format        Class       Challenge  Bytes
======  ============  ==========  =========  ===========================
tdx     quote         signed      64         Intel TDX DCAP Quote
tdx     quote-dice    signed      64         DICE-based TDX Quote
tdx     ccel          event-log   none       ACPI CCEL log area, a TCG
                                             crypto-agile event log
spdm    cert-chain    cert-chain  none       SPDM certificate chain,
                                             instance = slot 0-7
spdm    vca           auxiliary   none       SPDM version, capabilities
                                             and algorithms transcript
spdm    measurements  signed      32         SPDM GET_MEASUREMENTS
                                             response
spdm    tdisp-report  auxiliary   none       TDISP interface report
tpm     quote         signed      varies     TPM2_Quote's attestation
                                             structure and signature
tpm     event-log     event-log   none       TCG PC Client crypto-agile
                                             event log
tpm     ek-cert       cert-chain  none       EK certificate from NV
armcca  token         signed      64         CCA attestation token,
                                             platform and realm parts
armcca  event-log     event-log   none       Realm firmware log, if any
snp     report        signed      64         SNP attestation report
snp     cert-table    cert-chain  none       VCEK or VLEK, ASK and ARK
======  ============  ==========  =========  ===========================

Did I miss something that would break us here?

CTLV layout draft:

    device-get reply, caps.evidence:
      objects[16]:
        id: uint(..15)
        class: evidence-class
        # The reply says which one was written.
        formats[4]: evidence-format
        max-length: uint
        # Signed objects only, entries as today.
        challenge-lengths[8]?: ...
        # Descriptive, such as an SPDM slot.
        instance?: uint(..u32-max)
        # When the TCB vouches for the object with a digest.
        tcb-digest-algo?: hash-algo

    evidence-get request:
      # Required exactly when a signed object is named.
      challenge?: binary(1..4K)
      objects[16]:
        id: uint(..15)
        data: blob(out, va memfd dma-buf)
      # selection, privlevel, service and options as now.

    evidence-get reply:
      # In request order.
      objects[16]:
        format: evidence-format
        length: uint
        tcb-digest?:
          hash-algo: hash-algo
          data: binary(16..64)
      # The generations as now.

Makes sense?
