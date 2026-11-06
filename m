Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975124;
	b=hmBf8mKESCFw3QyupKJwRaNllhmnQT8hUxips+yCYaixwmbB1tQQnS4YtJKeVp6AXRp1
	 VwqMSC5KDU+qwe7AMExKAv+2rTw5yzbzBjDGxG0I20n8Di142vsIaNH5TUQmIw6wRUFKi
	 o8Jre17jyh6Qo8AcNm8IIX4dCPbyzcMfmlEinp5gisusfwGtVKuzGOSiMUN5ghc4tuC6u
	 dTutyVehscwgWon62zjeVWUtA8h+haVrSK0RY2ZK6dWh/oJiTq9VMqW85Mofw+7wOl11z
	 nW8sr/Twoe5Ze5xh8RxEwfXG0AYGEDLjV3Ssz8KMj/NDDuoTwsWjHyyMSMvIyV12xBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XjubV5JgjeqjPXQH1+nVKdJIc9BEV5NX4y8ymGv5/6U=;
	b=oUDM10x0wteF9Vde72CRcxYZPV7812sIqx7arfQQnjPplKzPGDdlo4/ricHfNEOxFy5j
	 wts8Xas9nhaWM8BOAt07r5Mim7l/tPgHR76vhkiPW20bPl65Z9Ui4G8eviCWkOa2kJqZQ
	 c50OV21UfRVuowjjWlnegcrZ7urBYoWqEpLSilpVPtTIra3ixVzJg2GC1zcNj0/iPO9H2
	 Ak1i8Qz5OPqVi4L24DNMrW9fWw9bO1JQREg1TNCZNIadswObAZ6BX0zUr1MdV7FBREPRI
	 EaIKwFSC2PRMAXx/JPVYpRm/OdZcYEuFooJaOBdB6OhbiNKIY5z8M650Qw6A+wSy6Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=pUp7u6F0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C4606A32F
	for <linux-coco@lists.linux.dev>; Fri,  6 Nov 2026 14:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97C4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=pUp7u6F0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so6673325e9.2
        for <linux-coco@lists.linux.dev>; Fri, 06 Nov 2026 06:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793975121; x=1794579921; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XjubV5JgjeqjPXQH1+nVKdJIc9BEV5NX4y8ymGv5/6U=;
        b=pUp7u6F0REst+vXoxCc1mv61/0zt12nXxw0QN/utT2Lxa50ysGjjTfFSiowIf6xBdV
         v3pl5KfJG0hU7B3O//fsn3fwuH8CR66G4eFu+nqBR0Qm/0Syx8q2HK77hKfhnK+BMKq1
         EPrwPPBrfhyZQUT2A9Gao9RjGfEUWsjs/VuEsSabnWbgjEZcp8+WGpogWPJV+Jxho43N
         9RuIkdWN1FzNRVw5CWbN/tIUGpGwfFjdLv3I61ONG/zG1RQEpGdrtHW1ya76GGbCxcmv
         YEyGdKeFNc0qze2HeMiXQiAc0Kq6z8VldekheP6Qmmbfevgfg7K2PFeIul1ehBaBdzpe
         77BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975121; x=1794579921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjubV5JgjeqjPXQH1+nVKdJIc9BEV5NX4y8ymGv5/6U=;
        b=tcVBeg6rG4ufzWiFnFsGpaWOXYMNw+NLd1XFRSge7va+b349wkpmpHAkB1zdmdlAIk
         JYotb0LrCGXPuFbB/evcihm5sfTJBWmJDpYWbScyrfxWnB6qt5B5fRxn71Uhg5+Ogr+W
         8v9716KSiJKq4IBnddvIvX4lwnjjZ/NsCvOPBkq2lIy0M5AKBaAy6ttGvYaBMw8mHyVD
         oNRPpRBooXSY6AGIFktS9UL6LJtV6aj//C04W9+ol6TsU63G3ccVJsHtjnOU10bVDv9D
         5M1+9D37zx7pX3tUqY00MOeIP1v30gep1E/pxUmzd/X4XvQv7hEGlvWBVHGqc+MMoawh
         ehjw==
X-Forwarded-Encrypted: i=1; AKwUvBzv+nBvapkHs7wd1/JnWo5wuGcjY2jGGhHOG9Qi7VkY6h/1OBYAsZ9UFJJsH90aQxoFm9aECJH9q9C5@lists.linux.dev
X-Gm-Message-State: APuU4Z9RphxYTvlq93EDw8JBmOU4gsKyCoWCWWOPsu/rTtYRnTjvOBOY
	ZOCgoj1oLjy4BWWE6+f95sP/RADgpA7V9KGPMJLHySUeVA+WEbAH/gj5RfbSm+8GOy4=
X-Gm-Gg: AYBFou2bb9Wtm4Y73rLJi69w2w69cSazd4a1caJB0ke3pN6XfxMSAQ/TzQWN8fsOyO8
	jwyipib9jxcYPTc6RJzIAywDSiB2tOVjQZPkb6mD+GwfJCdNXbiwBB6xoUz89swDJprEBBR1i+N
	0wsObRdHwjrSI4BPgSign+Y9ff63XrzuwGfku0ihQVHib34P5qcNequViB9dIl6zOf8qi82TFys
	iM5mUBE1xgkJgctVJUVEG85jL8h5YzP9YD3NH7T1UyvojCg3sEYVgh9eQxTedhMUnu06gn9zAkM
	y4N2YGeMoTw9jVQ8EF4o+CVuPsQ17bndbn/PHfAQ3SxFCExW9ZlVOxS1E3y08iojpdAsC0s5sDX
	JPnJ3XJR3IiDzWUvpxur+pi249OOEETezOokiRyQd8FpMgroWj7zk1bfg0hqphvjo8AlPASEjmQ
	eZMBq1Xh0hkb31Zhd2cCzfO7y6Vx0UAURZIqre+WgQd7D7RzRyGv1M5L5de2YojralMTmYTwVox
	0hoxW4G8hM3nqg1NXDB4Dg+MaLypum8S5QRp886Ua2aK+IgNRC9uMrtbmCWJ5taXuDevIL6Cp74
	CqVf4jjQQXNDxqrYajfSzGOEYr7yObpzum44
X-Received: by 2002:a05:600c:5307:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4b6de973c39mr43606025e9.7.1793975120493;
        Fri, 06 Nov 2026 06:25:20 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm136357845e9.5.2026.11.06.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:25:19 -0800 (PST)
Date: Fri, 6 Nov 2026 15:25:15 +0100
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
Message-ID: <au3i-0eDzJZaWukx@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
 <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
 <auy7IM0_S2tv7EZX@FV6GYCPJ69>
 <au2WdWFOYbPEv0Uj@e129823.arm.com>
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
In-Reply-To: <au2WdWFOYbPEv0Uj@e129823.arm.com>

Fri, Nov 06, 2026 at 09:57:25AM +0100, yeoreum.yun@arm.com wrote:
>On Fri, Nov 06, 2026 at 09:27:42AM +0100, Jiri Pirko wrote:
>> Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>> >On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> >> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> >> [..snip..]
>> >> >> 
>> >> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> >> > +					       const struct ctlv_cursor *request,
>> >> >> > +					       struct attestation_evidence_request *decoded,
>> >> >> > +					       struct attestation_evidence_object_request **objects)
>> >> >> > +{
>> >> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> >> > +	u32 challenge_length;
>> >> >> > +
>> >> >> > +	decoded->challenge =
>> >> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> >> > +	decoded->challenge_length = challenge_length;
>> >> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> >> > +	    challenge_length > caps->max_challenge_length)
>> >> >> 
>> >> >> Hmm, I'm not sure whether this check is required for
>> >> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> >> 
>> >> >> for example, if the provider provides two evidence:
>> >> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> >> 
>> >> >> might challenge is reuiqred for generating the token
>> >> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> >> 
>> >> >> However, in case of eventlog, it wouldn't require challenge.
>> >> >> for example, TPM event log or CCEL event log.
>> >> >
>> >> >Right
>> >> >
>> >> >> Do we need some field on attestation_evidence_supported_object whether
>> >> >> it requires challenge or not and applies this sanity check per the object?
>> >> >> 
>> >> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> >> always.
>> >> >
>> >> >I wonder if we should have two interfaces here for signed and unsigned
>> >> >evidence? It would be clearer for userspace then when it needs to
>> >> >provide a challenge or not.
>> >> 
>> >> Isn't the challenge field provided/not-provided enough?
>> >> 
>> >> Currently on the introspection side, device-get op would provide
>> >> challenge-lengths array:
>> >> 
>> >>         evidence?:
>> >>           challenge-lengths[8]:
>> >>             length?: uint(..4096)
>> >>             min-length?: uint(..4096)
>> >>             max-length?: uint(..4096)
>> >>  	  objects[16]:
>> >>             blob-class: evidence-blob-class
>> >>             max-length: uint
>> >>             blob-instance?: uint(..u32-max)
>> >> 
>> >> I think it would make sense to have challenge-lengths array per object:
>> >> 
>> >>  	  objects[16]:
>> >>             blob-class: evidence-blob-class
>> >>             max-length: uint
>> >>             blob-instance?: uint(..u32-max)
>> >>             challenge-lengths[8]:
>> >>               length?: uint(..4096)
>> >>               min-length?: uint(..4096)
>> >>               max-length?: uint(..4096)
>> >> 
>> >> Then the unsigned object would just simply have challenge-lengths empty?
>> >
>> >This looks good to me. :)
>> 
>> The challenge is one of several open points that all depend on what an
>> evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
>> "primary", "raw" and the format strings. Here is my proposal to settle
>> these together:
>> 
>> The model:
>> 
>> 1. device-get lists each object with an id, a class (signed, event-log,
>>    cert-chain or auxiliary), the formats it may come in, its max-length
>>    and, for signed objects only, challenge-lengths.
>> 2. evidence-get names objects by id, as MR ops name MRs, each with its
>>    output blob. It carries a challenge exactly when it names a signed
>>    object, and the challenge has to fit each of them.
>> 3. The reply gives each object's format, length and, where the TCB
>>    vouches for it, the TCB's digest. The output is always {label, data}.
>> 4. A signed object is made by the call, over the challenge, and never
>>    reused. The rest are read as they stand.
>> 
>> This settles following issues discussed during this patchset review:
>> 
>> 1. One op, not two. Per-object challenge-lengths tell userspace when to
>>    pass a challenge, and one call returns the signed object with the log
>>    and certificates needed to check it.
>> 2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
>>    /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
>> 3. TDX's Quote object lists the legacy and the DICE format. The provider
>>    labels what the host returned and fails on a Quote it cannot label.
>> 4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
>>    spdm-measurements and tdisp-report become formats, and signature
>>    goes, as a signed object carries its own.
>> 5. "raw" goes with the representation attr. The TCB digest is a reply
>>    field, so a blob always holds the object's own bytes.
>> 
>> Formats become an enum each provider family defines, instead of free
>> strings. I'm still unsure if format should be entirely provider-specific
>> and defined as "extension", or it should be somehow mixture of common
>> and provider-specific. Looks there is not really much common
>> anyway, so I lean towards provider-specific only. So far I have:
>
>Overall, This is plausible for me with some small question.
>
>> 
>> ======  ============  ==========  =========  ===========================
>> Family  Format        Class       Challenge  Bytes
>> ======  ============  ==========  =========  ===========================
>[...]
>> tpm     ek-cert       cert-chain  none       EK certificate from NV
>
>Just a thought, but how are we planning to retrieve
>the NV index for EK certificate?
>
>As far as I know, TPM NV storage doesn't support labeling.
>
>Should I assume that the NV index would be specified as part of the
>challenge to retrieve the certificate from TPM NV storage?

evidence-get allows to accept mr-selection as part of the request
alongside the challenge.


>
>[...]
>> armcca  event-log     event-log   none       Realm firmware log, if any
>
>JFYI, this would be a CCEL log like tdx:
>  - https://github.com/tianocore/edk2/issues/11384

Okay.

>
>
>> snp     report        signed      64         SNP attestation report
>> snp     cert-table    cert-chain  none       VCEK or VLEK, ASK and ARK
>> ======  ============  ==========  =========  ===========================
>> 
>> Did I miss something that would break us here?
>> 
>> CTLV layout draft:
>> 
>>     device-get reply, caps.evidence:
>>       objects[16]:
>>         id: uint(..15)
>>         class: evidence-class
>>         # The reply says which one was written.
>>         formats[4]: evidence-format
>>         max-length: uint
>>         # Signed objects only, entries as today.
>>         challenge-lengths[8]?: ...
>>         # Descriptive, such as an SPDM slot.
>>         instance?: uint(..u32-max)
>>         # When the TCB vouches for the object with a digest.
>>         tcb-digest-algo?: hash-algo
>> 
>>     evidence-get request:
>>       # Required exactly when a signed object is named.
>>       challenge?: binary(1..4K)
>>       objects[16]:
>>         id: uint(..15)
>>         data: blob(out, va memfd dma-buf)
>>       # selection, privlevel, service and options as now.
>> 
>>     evidence-get reply:
>>       # In request order.
>>       objects[16]:
>>         format: evidence-format
>>         length: uint
>>         tcb-digest?:
>>           hash-algo: hash-algo
>>           data: binary(16..64)
>>       # The generations as now.
>> 
>> Makes sense?
>
>For me, It seems fine.
>
>-- 
>Sincerely,
>Yeoreum Yun
