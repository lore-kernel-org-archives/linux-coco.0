Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212447;
	b=o9IpRNb5GYe0anxfGqDihMg2+mv2UsbXtNuwP+o4avIPk+w8SefA4b9znSmeJeCdsaeC
	 KWgDTlZ8rEcjDFKVwFCEX5f7BGZJXqUszIcgd8GEGQ4zyM2fRbRAAUDROBjAHL7iAIwCd
	 XK2layDiF5IHXzrFimQPs2p1DG0VnLwbScWvLBps0Nutxl5AaNNW82TFpSvv7K1d6mQYY
	 RYgneOsU9UFfEt15wdh06/QXxihqP1bqV2awt57GKfws9E2BXROcwZ/+tBYyQwBbm9PlN
	 av8SL0t/kjheneY/SoHrUFxFNn4XKEZfoq1go2nNS0L/6MsejqLE8A/QRXeL8goTI0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RUNLXElxYcf5X5beoAPSp59pareCo5mXiU9bMCYY1Rc=;
	b=pHibnavGNcChtpa4GV6HaxdQ+dCPe+YUjRiLGDc+v72jUds8Q7WezwNV+EqS7f+vUVBP
	 YPiwRnL2YEa5cjxZxoOQrmMoJEQgMT2+YXFZS2alN8b6lnqmXTJGdx3aPBEuNE5iYVMg0
	 ++bwcRIIa+7bQycmWieXmVOza0vAxIMEqzJj+S3cVxyb4pC5m5TCS2Nk0ymA/y971A6wL
	 uFEcbi7hQ+nr6MTduos+6K10VNKG803ADFdyh2dr9iqVZhYHXGUoZoXTSOtk9rGv16hr0
	 N2KQiI4++1t7Sx7klx477hFR03oezPYTyLC072fRbKlBkacHCwbkiL6TyTf3r0bSF2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=QWKVlynX;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACF606A32A
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 08:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0ACF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=QWKVlynX
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49412eb1474so327899f8f.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 00:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794212444; x=1794817244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUNLXElxYcf5X5beoAPSp59pareCo5mXiU9bMCYY1Rc=;
        b=QWKVlynX61U6uVn0DrMPGTJW+tx7uWw6vvCAK6f6lFZ2WUPLqING8sQ7JI87TJi0Ri
         oMTi6MK2fgKbgd1TPtvhtOlBsWj8x95L2tS29LdnDHBXV09dDFO2XbSF+XaXeWILQYZI
         Akh9eG0EHYQvlOHiyRNvurM5VN8vl4g+0Id6J8LW4Jyu8FuJUsDUNeOYP9MqKUvPJcEl
         9sqHqH8VK/6K7bXzvvtZ2dllAGhoVF8wVuQHp8qCyEyZkkVbk4y2N8y3ARn3wq6nav4P
         JEdZP4nt5BUbt2YeIOPHe5Np8i7e2TxOBTjGJec2ZyoKuVsNLL1/DYqjIjBkOxZNBj2v
         oi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212444; x=1794817244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUNLXElxYcf5X5beoAPSp59pareCo5mXiU9bMCYY1Rc=;
        b=K5LdOrX6wsEeal+DSqr/BgxsqvEbotmzsMzV7vPZp2nn8y+0DSq3XPsWR/MPdIZDMh
         l7TFOxKXjzsQCqCaA/hbEKtNNp85N/TJ6iQAGkrMJ9+jEnc9K80AMOJiQVfRJqWXzr9I
         a0hjiQvXjXUhUU4sJs6F0688ZiIr+P5UDhuWxv3Y2oGmbRhCdqoJpwMczRbPWvP2HihY
         E0z5PujQS4Mc53hHvx00GGrtemOSPOi8fO2n34h5O+PTMuCdSBIYETVGz0Al1Ee9KJLM
         CUhZpEIOMF7wPqEFaRLrrkZHAvxYOpM+QNaOEM+uibD8e6/NeWmavFxcF20Qjz/ZBF9r
         MrNw==
X-Forwarded-Encrypted: i=1; AL+hErFfhkbkJpj//IBZOu3Kmh8COgI9bo/8XVmdDtCbNPjXGs8PGk/i8iRU56Blu39z8pFLSWK/sWeCTzBq@lists.linux.dev
X-Gm-Message-State: APuU4Z8FxVFY+meDvU5F0+VnHzc9NdBuWjwtzHr4u+Kkfv8ihI7SFeWA
	J4c06NfyKi2Rbeo85xJp1I1lcOKPEX2kaaaePd9YMLYyiq6wUs0xnYRYze2hY3eCB48=
X-Gm-Gg: AYBFou2z0Di2Yph3Qe1GZeFiqIHnbd2iPC1fuZzmW6IkuS/Ln/pr+YBbSZodiAWqidf
	RYhfyRHjaXHETZkP5maLJ78np4BqJKeCsYSfAI04etoOzGpCDnS0Ib1OUmYDvuZUu1P3Eg+W9mE
	mSi6JUTVfu3Nh9liUpfDlu0HqDQ536vdPO0LCHGWl8h/ZRsHtH9CTDKg31q34lLGYaLMNnKvb9W
	pJBgq7wkSNsWk56R4jXPK/4JIv90tZjyIEzgCJ/XRr/Ml1WURDNL3AD0QV/RgiX5iXDMTlfe8cU
	kmRHTnXUO2+IT3VjDJDDLRM0njFAHh7M9yu7zFMNwM0JQcIWnTIG10gE6wxFN23rCaxnLlxMlLP
	PC5JtixVE4UjqynPWmByDFQYdtpD2pC/GyauYoWd0SuKaKyjERXAmkZT162fOJ5BpR4oxWqh706
	E8UEbia8oOjr3OIJjeASoCd9Q8VrOIQUYwkJyrDngeI5I9RI/DKtimIYHcqUgrHvr4OA9FdVpQS
	jH3B9A5+9lLn54Oc0SKknntLY3XnoSrCsJrYK4APdmRyt75w8o6xJxFXlv2v109ZFA3gMSuO6VF
	Qs8DMV5WyUbz4FxhloNPwSMqP6FQbqRabXc=
X-Received: by 2002:adf:e193:0:b0:491:e28b:1e1e with SMTP id ffacd0b85a97d-4958335a7efmr5753338f8f.28.1794212443701;
        Mon, 09 Nov 2026 00:20:43 -0800 (PST)
Received: from localhost ([165.85.84.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b203b5sm8882576f8f.51.2026.11.09.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:20:43 -0800 (PST)
Date: Mon, 9 Nov 2026 09:20:39 +0100
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
Message-ID: <avGCQbvGBIDWD6GD@FV6GYCPJ69>
References: <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
 <auy7IM0_S2tv7EZX@FV6GYCPJ69>
 <au2WdWFOYbPEv0Uj@e129823.arm.com>
 <au3i-0eDzJZaWukx@FV6GYCPJ69>
 <au3mAsQrh0GniXJo@e129823.arm.com>
 <au34wXtIqii-hfFI@FV6GYCPJ69>
 <au3-LyBiCZtUMpEx@e129823.arm.com>
 <au9eskF5P17h3cql@FV6GYCPJ69>
 <au9sUBtdnDk9yA1U@e129823.arm.com>
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
In-Reply-To: <au9sUBtdnDk9yA1U@e129823.arm.com>

Sat, Nov 07, 2026 at 07:22:08PM +0100, yeoreum.yun@arm.com wrote:
>On Sat, Nov 07, 2026 at 06:25:54PM +0100, Jiri Pirko wrote:
>> Fri, Nov 06, 2026 at 05:19:59PM +0100, yeoreum.yun@arm.com wrote:
>> >On Fri, Nov 06, 2026 at 05:03:32PM +0100, Jiri Pirko wrote:
>> >> Fri, Nov 06, 2026 at 03:36:50PM +0100, yeoreum.yun@arm.com wrote:
>> >> >> Fri, Nov 06, 2026 at 09:57:25AM +0100, yeoreum.yun@arm.com wrote:
>> >> >> >On Fri, Nov 06, 2026 at 09:27:42AM +0100, Jiri Pirko wrote:
>> >> >> >> Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>> >> >> >> >On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> >> >> >> >> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >> >> >> >> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> >> >> >> >> [..snip..]
>> >> >> >> >> >> 
>> >> >> >> >> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> >> >> >> >> > +					       const struct ctlv_cursor *request,
>> >> >> >> >> >> > +					       struct attestation_evidence_request *decoded,
>> >> >> >> >> >> > +					       struct attestation_evidence_object_request **objects)
>> >> >> >> >> >> > +{
>> >> >> >> >> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> >> >> >> >> > +	u32 challenge_length;
>> >> >> >> >> >> > +
>> >> >> >> >> >> > +	decoded->challenge =
>> >> >> >> >> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> >> >> >> >> > +	decoded->challenge_length = challenge_length;
>> >> >> >> >> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> >> >> >> >> > +	    challenge_length > caps->max_challenge_length)
>> >> >> >> >> >> 
>> >> >> >> >> >> Hmm, I'm not sure whether this check is required for
>> >> >> >> >> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> >> >> >> >> 
>> >> >> >> >> >> for example, if the provider provides two evidence:
>> >> >> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >> >> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> >> >> >> >> 
>> >> >> >> >> >> might challenge is reuiqred for generating the token
>> >> >> >> >> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> >> >> >> >> 
>> >> >> >> >> >> However, in case of eventlog, it wouldn't require challenge.
>> >> >> >> >> >> for example, TPM event log or CCEL event log.
>> >> >> >> >> >
>> >> >> >> >> >Right
>> >> >> >> >> >
>> >> >> >> >> >> Do we need some field on attestation_evidence_supported_object whether
>> >> >> >> >> >> it requires challenge or not and applies this sanity check per the object?
>> >> >> >> >> >> 
>> >> >> >> >> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> >> >> >> >> always.
>> >> >> >> >> >
>> >> >> >> >> >I wonder if we should have two interfaces here for signed and unsigned
>> >> >> >> >> >evidence? It would be clearer for userspace then when it needs to
>> >> >> >> >> >provide a challenge or not.
>> >> >> >> >> 
>> >> >> >> >> Isn't the challenge field provided/not-provided enough?
>> >> >> >> >> 
>> >> >> >> >> Currently on the introspection side, device-get op would provide
>> >> >> >> >> challenge-lengths array:
>> >> >> >> >> 
>> >> >> >> >>         evidence?:
>> >> >> >> >>           challenge-lengths[8]:
>> >> >> >> >>             length?: uint(..4096)
>> >> >> >> >>             min-length?: uint(..4096)
>> >> >> >> >>             max-length?: uint(..4096)
>> >> >> >> >>  	  objects[16]:
>> >> >> >> >>             blob-class: evidence-blob-class
>> >> >> >> >>             max-length: uint
>> >> >> >> >>             blob-instance?: uint(..u32-max)
>> >> >> >> >> 
>> >> >> >> >> I think it would make sense to have challenge-lengths array per object:
>> >> >> >> >> 
>> >> >> >> >>  	  objects[16]:
>> >> >> >> >>             blob-class: evidence-blob-class
>> >> >> >> >>             max-length: uint
>> >> >> >> >>             blob-instance?: uint(..u32-max)
>> >> >> >> >>             challenge-lengths[8]:
>> >> >> >> >>               length?: uint(..4096)
>> >> >> >> >>               min-length?: uint(..4096)
>> >> >> >> >>               max-length?: uint(..4096)
>> >> >> >> >> 
>> >> >> >> >> Then the unsigned object would just simply have challenge-lengths empty?
>> >> >> >> >
>> >> >> >> >This looks good to me. :)
>> >> >> >> 
>> >> >> >> The challenge is one of several open points that all depend on what an
>> >> >> >> evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
>> >> >> >> "primary", "raw" and the format strings. Here is my proposal to settle
>> >> >> >> these together:
>> >> >> >> 
>> >> >> >> The model:
>> >> >> >> 
>> >> >> >> 1. device-get lists each object with an id, a class (signed, event-log,
>> >> >> >>    cert-chain or auxiliary), the formats it may come in, its max-length
>> >> >> >>    and, for signed objects only, challenge-lengths.
>> >> >> >> 2. evidence-get names objects by id, as MR ops name MRs, each with its
>> >> >> >>    output blob. It carries a challenge exactly when it names a signed
>> >> >> >>    object, and the challenge has to fit each of them.
>> >> >> >> 3. The reply gives each object's format, length and, where the TCB
>> >> >> >>    vouches for it, the TCB's digest. The output is always {label, data}.
>> >> >> >> 4. A signed object is made by the call, over the challenge, and never
>> >> >> >>    reused. The rest are read as they stand.
>> >> >> >> 
>> >> >> >> This settles following issues discussed during this patchset review:
>> >> >> >> 
>> >> >> >> 1. One op, not two. Per-object challenge-lengths tell userspace when to
>> >> >> >>    pass a challenge, and one call returns the signed object with the log
>> >> >> >>    and certificates needed to check it.
>> >> >> >> 2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
>> >> >> >>    /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
>> >> >> >> 3. TDX's Quote object lists the legacy and the DICE format. The provider
>> >> >> >>    labels what the host returned and fails on a Quote it cannot label.
>> >> >> >> 4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
>> >> >> >>    spdm-measurements and tdisp-report become formats, and signature
>> >> >> >>    goes, as a signed object carries its own.
>> >> >> >> 5. "raw" goes with the representation attr. The TCB digest is a reply
>> >> >> >>    field, so a blob always holds the object's own bytes.
>> >> >> >> 
>> >> >> >> Formats become an enum each provider family defines, instead of free
>> >> >> >> strings. I'm still unsure if format should be entirely provider-specific
>> >> >> >> and defined as "extension", or it should be somehow mixture of common
>> >> >> >> and provider-specific. Looks there is not really much common
>> >> >> >> anyway, so I lean towards provider-specific only. So far I have:
>> >> >> >
>> >> >> >Overall, This is plausible for me with some small question.
>> >> >> >
>> >> >> >> 
>> >> >> >> ======  ============  ==========  =========  ===========================
>> >> >> >> Family  Format        Class       Challenge  Bytes
>> >> >> >> ======  ============  ==========  =========  ===========================
>> >> >> >[...]
>> >> >> >> tpm     ek-cert       cert-chain  none       EK certificate from NV
>> >> >> >
>> >> >> >Just a thought, but how are we planning to retrieve
>> >> >> >the NV index for EK certificate?
>> >> >> >
>> >> >> >As far as I know, TPM NV storage doesn't support labeling.
>> >> >> >
>> >> >> >Should I assume that the NV index would be specified as part of the
>> >> >> >challenge to retrieve the certificate from TPM NV storage?
>> >> >> 
>> >> >> evidence-get allows to accept mr-selection as part of the request
>> >> >> alongside the challenge.
>> >> >
>> >> >Sorry. Could you explain a little bit detail for this?.
>> >> >AFAIU, this is to get the EK certificate from TPM non-volatile storage.
>> >> >But, I don't know why *EK* certificate get would be relevant for
>> >> >*mr selection*.  AFAIK, the TPM_Quote will be used AK not a EK.
>> >> 
>> >> You are right, my mistake. I misunderstood the question.
>> >> 
>> >> mr-selection selects PCRs for Quote, or an extend-NV measurement
>> >> register for NV Certify.
>> >> 
>> >> An NV-resident EK certificate is retrieved using NV_Read. I think
>> >> blob-instance is a good fit. For TPM certificate objects, it could
>> >> identify the certificate's NV index.
>> >
>> >Ah. I missed the TCG_EK_Credential_Profile specification which defines
>> >the NV index value for EK certificate:
>> >
>> >2.2.1.4 Low Range
>> >  The Low Range is at NV Indices 0x01c00002 - 0x01c0000c.
>> >    0x01c00002 RSA 2048 EK Certificate
>> >    0x01c00003 RSA 2048 EK Nonce
>> >    0x01c00004 RSA 2048 EK Template
>> >    0x01c0000a ECC NIST P256 EK Certificate
>> >    0x01c0000b ECC NIST P256 EK Nonce
>> >    0x01c0000c ECC NIST P256 EK Template
>> >
>> >But, do we need some argument to get which EK certificate to get?
>> >(RSA or ECC NIST P256)?
>> 
>> Why blob-instance 0-10 is not good enough here?
>
>No, it's enough with just breaking down format like:
>======  ============  ==========  =========  ===========================
>Family  Format        Class       Challenge  Bytes
>======  ============  ==========  =========  ===========================
>tpm     ek-cert-rsa   cert-chain  none       EK certificate from NV
>tpm     ek-cert-ecc   cert-chain  none       EK certificate from NV

Okay, that looks fine to me.


>
>> 
>> 
>> >
>> >Otherwise, Is this interface going to print all EK certificate
>> >regardless of alg?
>> >
>> >> >Also, AFAIK, mr_selection is meaningful when the evidence_accept is
>> >> >supported.
>> >> 
>> >> These are independent. mr-selection chooses the measurements included
>> >> in evidence. EVIDENCE_ACCEPT authorizes a subsequent native transition.
>> >> The TPM provider can quote selected PCRs without supporting acceptance.
>> >
>> >Acked.
>> >
>> >-- 
>> >Sincerely,
>> >Yeoreum Yun
>
>-- 
>Sincerely,
>Yeoreum Yun
