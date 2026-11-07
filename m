Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072363;
	b=Xv7UWOt6mwQzCCNTDOXH8OQTJbp0rwnR/l8U9DU74YAsWnI95oXd391uKGRYFsU9A2LM
	 8N/gSoD++SjOpj+030rmiUrrIRv9u+S+nzG+VZ3QYRIP9SKM/us302iMnUn1n8do2Dy7Q
	 d0B8rUoXgU54B3ArsFBFw3inPOZwovYvC4/72B2q3Yeb38dNhCsdBFQe4YiVcR4IItryy
	 M8nO6XES2AAy9AP/Az3g0GakFb+rMofto+EsJqpTakOdofseUu7nfgO1ERjvyDAQsKHtK
	 Q0ibqFoMFaERBS1NaMOnYDHua3Mow2JMYkrHAHfvFCyOYN5Anwu1ifAGPJdOiPozQFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Jlkb43CuhYK9URTlTKbtpRdBwEHEC6l0yC9HgESgF6k=;
	b=1jH1dDL/3V9E4XbdUjr5eOGC84siVuqJYoPU4W7bc2otw6CnLOqgK7RmJ0yvhNQXNjFK
	 Wx2YvAMW7sICo/0vvkR4Z6GsX7bWu7HOi0NcHpRuVt5WmjS9jCzSa49UPeS+tDdLxe3RY
	 VC4CP7Qot/+saSYPu2kL9IXJxlx46w4aoyrZxsMGBzru+uZGzNC66nXAgrdwFuBI+9tmp
	 J8g+eeXelwkksj7BXoiV6XWKG7E5gaZYKhY0JmLpPqQ9VuXV/6u5hxcS0Dnq5v0aWS6nB
	 jMvsa7LeDXAnJZrLxtH230ilBLP4uaJxd6QXUSX4Ah1f6EsKHjE6ZkY5MeBmafK5+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=XyF2ao5M;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5E606A32F
	for <linux-coco@lists.linux.dev>; Sat,  7 Nov 2026 17:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C5E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=XyF2ao5M
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso206228666b.3
        for <linux-coco@lists.linux.dev>; Sat, 07 Nov 2026 09:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794072360; x=1794677160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jlkb43CuhYK9URTlTKbtpRdBwEHEC6l0yC9HgESgF6k=;
        b=XyF2ao5MdT3ztqk9H4wPFFEPjDCT5NIS5C+AoYiW75WwX5URqQWhgWVbupOo0XHRLX
         tcTLZ4myaWiz5x63qrMNuu8+fRhh2AZvP3BGJPT72p6GhSoAiiaPhMmp5HdH5f8hqH9q
         OkSGiDOJNzDH80dWd/uTcLkJkYquHqRFEU5hP6QNUpGd/JURe0YDhk+2HJoNAeCAR3sV
         0b9x8whi9zGx9I7qhTJZM8UVwSoEzTA6OU4CXrA4do2CgVMFmkB6xbH2/AFLCNpA8MtP
         vMk8LOwhbN7AfWFT+nDfmRuGH4pg81QZbN+Y+JGkKtMMGfvviQQJy1Da3W7R7EARnr4Q
         yDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072360; x=1794677160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jlkb43CuhYK9URTlTKbtpRdBwEHEC6l0yC9HgESgF6k=;
        b=Y62GJALRxYBNyL1GL66s0U+JaWfBwS0bkt5Af3l1zMksK5zDiPdDdvz4CmfOmiilJK
         uYGxMhJVZaYw/NW+pnhrtuBG/k3He14HIPV5OdAqIxA2E6x6/R6mggcwxjIPOOknWwwl
         qrj2wUQNrUrmTslX8JDwr6K0dzQxElmJ15bJLhBrTtDQvm6jUAK+ubbnr4+oGtvCalcW
         WXPPukQ1sD1MJb0qBqfjsRI99S3YRX03ucdaj1C6Ck6+CzpExyJP05daIvaxgloYUjmU
         NcJptS2qczmTSn5iaJcwjByy64hNSY8I53BP/9OW3QO+F8PZbrrBsgmlpNGtIZaL0tX7
         tD1Q==
X-Forwarded-Encrypted: i=1; AL+hErGYoIzo4i5lnd0+sRnX0q9UnCxg8pqk8a4xqqyQOFmf1dOy9F92QYi9+hZsM0hkofMlpG6jC8EfeGoM@lists.linux.dev
X-Gm-Message-State: APuU4Z+gSLnZfB9WX2mQE/CTZiKKcisER4vqPtnfdYej+hXYm03dEb5c
	V+ix9ptiEsAPNOQQSaw/tldoIN5LkyxHrR//zwSHmP30MLAYMDm+3sxn3tps8Z+wTEE=
X-Gm-Gg: AYBFou0ctPjg49UGIz3UHq1gQNiixpgU0Uum/ueDydGVEIAqHyBv103bALmCEpjxhEU
	f0Jfhi8RpWR+UyzHdPOuj1g2GJE7dHwVvdr78QGcH00SDMx4BQ0jElV5YcsX/D6J2VGmssLUcJW
	LnUKOYTO8bn+kLoKlTdIA8KDvtGcj+OiR7bgUQC0SIATg+LZn6YopnyX+uxeTzEaqqqNvJLy7u+
	dCF8mrTibd9SelbRbmWYmd+DQonIUOsoWStVjAdtQ7MrrRN7ywyYVeyLr9K9v6JeX0jUHc7HhiH
	anJtwVc8qw9MZ52K1E7gJSpMCLp8G7UVDw9hYbZGM2tnekFYb5qoWslWmv1zFZ0oUjNjqwIXbEG
	q04t8G26+zjnBfB1JuNQyOqGeyU34HaAuwaKSsq0IvmkGVeKIfmx4OmKyj71zcBPSFUd6BM5OGm
	JnD0uAF7s4kmvACWleheAQVdVltRwlxeOoI/ny0H7/3xhdPAOranQmR9eBaLiQPoFLrMJztdKdw
	Banw3YR0b+yP6CwWr+LiyEUP53B62/H6UVypMkjMUT3p6qws4OOfcQSa5XaZ1MpYjah8kjDr/iU
	UDpOE+2t+Fbe32YjK3llV3ZIhHls/HSl6cb/iMw=
X-Received: by 2002:a17:907:d03:b0:c46:7fa4:9224 with SMTP id a640c23a62f3a-c4d34a649eamr425140966b.8.1794072359468;
        Sat, 07 Nov 2026 09:25:59 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569edc9sm165153366b.50.2026.11.07.09.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:25:58 -0800 (PST)
Date: Sat, 7 Nov 2026 18:25:54 +0100
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
Message-ID: <au9eskF5P17h3cql@FV6GYCPJ69>
References: <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
 <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
 <auy7IM0_S2tv7EZX@FV6GYCPJ69>
 <au2WdWFOYbPEv0Uj@e129823.arm.com>
 <au3i-0eDzJZaWukx@FV6GYCPJ69>
 <au3mAsQrh0GniXJo@e129823.arm.com>
 <au34wXtIqii-hfFI@FV6GYCPJ69>
 <au3-LyBiCZtUMpEx@e129823.arm.com>
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
In-Reply-To: <au3-LyBiCZtUMpEx@e129823.arm.com>

Fri, Nov 06, 2026 at 05:19:59PM +0100, yeoreum.yun@arm.com wrote:
>On Fri, Nov 06, 2026 at 05:03:32PM +0100, Jiri Pirko wrote:
>> Fri, Nov 06, 2026 at 03:36:50PM +0100, yeoreum.yun@arm.com wrote:
>> >> Fri, Nov 06, 2026 at 09:57:25AM +0100, yeoreum.yun@arm.com wrote:
>> >> >On Fri, Nov 06, 2026 at 09:27:42AM +0100, Jiri Pirko wrote:
>> >> >> Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>> >> >> >On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> >> >> >> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >> >> >> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> >> >> >> [..snip..]
>> >> >> >> >> 
>> >> >> >> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> >> >> >> > +					       const struct ctlv_cursor *request,
>> >> >> >> >> > +					       struct attestation_evidence_request *decoded,
>> >> >> >> >> > +					       struct attestation_evidence_object_request **objects)
>> >> >> >> >> > +{
>> >> >> >> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> >> >> >> > +	u32 challenge_length;
>> >> >> >> >> > +
>> >> >> >> >> > +	decoded->challenge =
>> >> >> >> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> >> >> >> > +	decoded->challenge_length = challenge_length;
>> >> >> >> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> >> >> >> > +	    challenge_length > caps->max_challenge_length)
>> >> >> >> >> 
>> >> >> >> >> Hmm, I'm not sure whether this check is required for
>> >> >> >> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> >> >> >> 
>> >> >> >> >> for example, if the provider provides two evidence:
>> >> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> >> >> >> 
>> >> >> >> >> might challenge is reuiqred for generating the token
>> >> >> >> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> >> >> >> 
>> >> >> >> >> However, in case of eventlog, it wouldn't require challenge.
>> >> >> >> >> for example, TPM event log or CCEL event log.
>> >> >> >> >
>> >> >> >> >Right
>> >> >> >> >
>> >> >> >> >> Do we need some field on attestation_evidence_supported_object whether
>> >> >> >> >> it requires challenge or not and applies this sanity check per the object?
>> >> >> >> >> 
>> >> >> >> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> >> >> >> always.
>> >> >> >> >
>> >> >> >> >I wonder if we should have two interfaces here for signed and unsigned
>> >> >> >> >evidence? It would be clearer for userspace then when it needs to
>> >> >> >> >provide a challenge or not.
>> >> >> >> 
>> >> >> >> Isn't the challenge field provided/not-provided enough?
>> >> >> >> 
>> >> >> >> Currently on the introspection side, device-get op would provide
>> >> >> >> challenge-lengths array:
>> >> >> >> 
>> >> >> >>         evidence?:
>> >> >> >>           challenge-lengths[8]:
>> >> >> >>             length?: uint(..4096)
>> >> >> >>             min-length?: uint(..4096)
>> >> >> >>             max-length?: uint(..4096)
>> >> >> >>  	  objects[16]:
>> >> >> >>             blob-class: evidence-blob-class
>> >> >> >>             max-length: uint
>> >> >> >>             blob-instance?: uint(..u32-max)
>> >> >> >> 
>> >> >> >> I think it would make sense to have challenge-lengths array per object:
>> >> >> >> 
>> >> >> >>  	  objects[16]:
>> >> >> >>             blob-class: evidence-blob-class
>> >> >> >>             max-length: uint
>> >> >> >>             blob-instance?: uint(..u32-max)
>> >> >> >>             challenge-lengths[8]:
>> >> >> >>               length?: uint(..4096)
>> >> >> >>               min-length?: uint(..4096)
>> >> >> >>               max-length?: uint(..4096)
>> >> >> >> 
>> >> >> >> Then the unsigned object would just simply have challenge-lengths empty?
>> >> >> >
>> >> >> >This looks good to me. :)
>> >> >> 
>> >> >> The challenge is one of several open points that all depend on what an
>> >> >> evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
>> >> >> "primary", "raw" and the format strings. Here is my proposal to settle
>> >> >> these together:
>> >> >> 
>> >> >> The model:
>> >> >> 
>> >> >> 1. device-get lists each object with an id, a class (signed, event-log,
>> >> >>    cert-chain or auxiliary), the formats it may come in, its max-length
>> >> >>    and, for signed objects only, challenge-lengths.
>> >> >> 2. evidence-get names objects by id, as MR ops name MRs, each with its
>> >> >>    output blob. It carries a challenge exactly when it names a signed
>> >> >>    object, and the challenge has to fit each of them.
>> >> >> 3. The reply gives each object's format, length and, where the TCB
>> >> >>    vouches for it, the TCB's digest. The output is always {label, data}.
>> >> >> 4. A signed object is made by the call, over the challenge, and never
>> >> >>    reused. The rest are read as they stand.
>> >> >> 
>> >> >> This settles following issues discussed during this patchset review:
>> >> >> 
>> >> >> 1. One op, not two. Per-object challenge-lengths tell userspace when to
>> >> >>    pass a challenge, and one call returns the signed object with the log
>> >> >>    and certificates needed to check it.
>> >> >> 2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
>> >> >>    /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
>> >> >> 3. TDX's Quote object lists the legacy and the DICE format. The provider
>> >> >>    labels what the host returned and fails on a Quote it cannot label.
>> >> >> 4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
>> >> >>    spdm-measurements and tdisp-report become formats, and signature
>> >> >>    goes, as a signed object carries its own.
>> >> >> 5. "raw" goes with the representation attr. The TCB digest is a reply
>> >> >>    field, so a blob always holds the object's own bytes.
>> >> >> 
>> >> >> Formats become an enum each provider family defines, instead of free
>> >> >> strings. I'm still unsure if format should be entirely provider-specific
>> >> >> and defined as "extension", or it should be somehow mixture of common
>> >> >> and provider-specific. Looks there is not really much common
>> >> >> anyway, so I lean towards provider-specific only. So far I have:
>> >> >
>> >> >Overall, This is plausible for me with some small question.
>> >> >
>> >> >> 
>> >> >> ======  ============  ==========  =========  ===========================
>> >> >> Family  Format        Class       Challenge  Bytes
>> >> >> ======  ============  ==========  =========  ===========================
>> >> >[...]
>> >> >> tpm     ek-cert       cert-chain  none       EK certificate from NV
>> >> >
>> >> >Just a thought, but how are we planning to retrieve
>> >> >the NV index for EK certificate?
>> >> >
>> >> >As far as I know, TPM NV storage doesn't support labeling.
>> >> >
>> >> >Should I assume that the NV index would be specified as part of the
>> >> >challenge to retrieve the certificate from TPM NV storage?
>> >> 
>> >> evidence-get allows to accept mr-selection as part of the request
>> >> alongside the challenge.
>> >
>> >Sorry. Could you explain a little bit detail for this?.
>> >AFAIU, this is to get the EK certificate from TPM non-volatile storage.
>> >But, I don't know why *EK* certificate get would be relevant for
>> >*mr selection*.  AFAIK, the TPM_Quote will be used AK not a EK.
>> 
>> You are right, my mistake. I misunderstood the question.
>> 
>> mr-selection selects PCRs for Quote, or an extend-NV measurement
>> register for NV Certify.
>> 
>> An NV-resident EK certificate is retrieved using NV_Read. I think
>> blob-instance is a good fit. For TPM certificate objects, it could
>> identify the certificate's NV index.
>
>Ah. I missed the TCG_EK_Credential_Profile specification which defines
>the NV index value for EK certificate:
>
>2.2.1.4 Low Range
>  The Low Range is at NV Indices 0x01c00002 - 0x01c0000c.
>    0x01c00002 RSA 2048 EK Certificate
>    0x01c00003 RSA 2048 EK Nonce
>    0x01c00004 RSA 2048 EK Template
>    0x01c0000a ECC NIST P256 EK Certificate
>    0x01c0000b ECC NIST P256 EK Nonce
>    0x01c0000c ECC NIST P256 EK Template
>
>But, do we need some argument to get which EK certificate to get?
>(RSA or ECC NIST P256)?

Why blob-instance 0-10 is not good enough here?


>
>Otherwise, Is this interface going to print all EK certificate
>regardless of alg?
>
>> >Also, AFAIK, mr_selection is meaningful when the evidence_accept is
>> >supported.
>> 
>> These are independent. mr-selection chooses the measurements included
>> in evidence. EVIDENCE_ACCEPT authorizes a subsequent native transition.
>> The TPM provider can quote selected PCRs without supporting acceptance.
>
>Acked.
>
>-- 
>Sincerely,
>Yeoreum Yun
