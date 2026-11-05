Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881978;
	b=cn2vY4BOV20lGTrh05eV4vFt8hgRQsuHyfMl1Rp+3IB5n6CU2TtZ32UFHwxQdDk6Ku1/
	 t0RRVVoSYhFCarOuqyaYvqJEuyJKWR/vACaFANFW5/8Z8QJP+ut3wvcEOqqm8zGti415a
	 Hcqo7LPH1/f92ngOtMWs+P48rjuyA4Nu22xUCJj5/1R3g4apwUxmqDMGjHlrQ4q1Z/fsX
	 ownvP4d5QgJ47aPHH++OIsfQ8oGLmUYoICJgL9MoHcYQePjpGnAoii/IPJnlK/z2X8JNG
	 3h7FSZcDsoBW+3TjsorFPyxRiw2Q4jF5PBdXHD9A/U5ZqrFVHs3DHehTLEaMwK6mAZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
	b=EKI/1TP94MlLH3uKF4WRapOqxjhvA/KEzQKZMLjueehCor9Q/ucbMxrwqjIFNiSTxsjf
	 mnczWBw7XgUktYK5OjwyzAYmWw9uj/HHJAWPGMMYr7XAylAY6h+mdBsp1JdmzBr7qUoI7
	 6tpaSWWzJdp1Rl7tSLjRkMfC7uQ3aWulmkNjgiyspJUkjt8vW/1g/9tSCzJM/t1Q1jBZJ
	 3rLHDQ0hzyEoK5QNXweyKSjvzuh176mPmf0vbg6RK8DCyW7iJZYeQAiy1pPsM2/N6x4T0
	 fkMFw8sJ3vW8QtpW0aNRW2IZJ0uQTHnYglBIe12tNifTm0JHWk5BENhxGsn530Jd8WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=fj2QZV0w;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E84606A330
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 12:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E84606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=fj2QZV0w
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1036597e87.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 04:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793881975; x=1794486775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
        b=fj2QZV0wC/py2pU/ReJUvYT4JxpvOFzfVAm7EQB+gRsmvKo8pt3jXXa3w7RUspZQ6v
         uWTywaquayJ7cEExAhPmTVpkJygWkyCLJlBpp4VRikMO5e5lL/LdYBZCa/ovGEAQShN7
         tqTe8cpfX/Gg50G+9PFdp+9HtYhbF/hj4KFW5g6786FU28JLIgLm93dLKlHtvXR+A9yi
         lcBdC0eELjdA5BkV9E8tpN2FwpUzStqhRtJRg8vvybWzZzoj7KUIGyyiIu95tmaZpptv
         O1D1oSMfekOqgo7X/VIYrjxqSYO9OR/1Q8FTr5hy6VNwgZBVmTLDa81TQSmD9eZ0vBg6
         q6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881975; x=1794486775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
        b=tfhqszH54dwiu8wbDGtIMO6x3i9UkTWQhD6JkG3InryxTc6NKeptB5clT3mZdvYfFD
         5JR5iQ0L0Z9yJ2WiBLK1tFV/SKER+zbDoHvGXcHS8FenNP+QVesFLh//CMATXiAZO9Zs
         iuQou2JTS+CgxSu1V8QmKM5dalmw3fdSwHXVEiCcbUSvwteENDZ2AwMxJmUrqx2xQzzi
         iMrd5QVfI2v3tXU0PBSEtkFqUTMFdLok5w/gXvQ2vSaY4eypFRDmW/KvOHXlIEh4rzuF
         Dj8wq0dTBTzOU06CLSdNQUZF32l1rijaTe21xOTm9Jb7Wda0tQdCFdxQi7hDK42DInmQ
         gHnA==
X-Forwarded-Encrypted: i=1; AKwUvBxdqib4M1GwuWOhiIDib2s8iWPaF2AEV3MFvWhqMqaDxPjvoBBHbsw4ne2f4dXCw1Rw5YMPCalp0Qnu@lists.linux.dev
X-Gm-Message-State: APuU4Z8qrS5QIPdrkPOH0yoIRidiv8lczSN917cKAGUninWUG4HmKjxF
	nq1TXW4jG3qXBuGKMhEPyEuANBsc3i103q2FYN/gwxikfcqpVZuGt6fuouT2qDG2M4c=
X-Gm-Gg: AYBFou1mmxS6z2rkhcn4Vo/Ebo5+10g+NkvOwox3GwrqJue02NZHESTNAC/95G9E6mk
	NEGFqikJjSnVPtyDX6l+hce/GDXnkaqKolTB8/RMombAynLvlFa0dKGiY4v86faXqvM3i46kekO
	O50hPlt6oAdxW+xXbZouhfF3SjwCcM2Bc7qTxXoc5MpBXTzabrHi4vjg7IN0P7aGKL4mkK2u615
	KS4E2rcTawPYjpYPZLCwYMnvrqp6vdIvHKiouIBuwA0KLb1kOJutjOcRwcoqjEo2aW69LjKg8Yk
	DfYSK+KPSm1tXKpSRYo6lbo0isJXmR780TAagAorjFpZJ5lIKSwkapFiHi0MbgQFSNBL//zX3Cq
	EIBQCYAudfdEVgVdJIuGiv05Deiltj7NhEgYAObnkv9dKe83mM7IJSyDJYIC7CkW9fNWaShItDr
	oqgQQXbUmXmCepjXP9EImsvZbIjUB9NeJjxViIFFizzsJpiMXACsU9Zu2+5y8YqYRLsMf4wYWQ2
	scIhuTx//bpkZPPkbaF9tQe3usAvfHao/qg5O/i3MZbnipRXamTVcGcqIV2A/TPG9e1voyKMZYm
	Sh4GL4gXB0THnD5BYNqrVF4aBy712RBFSFepBJM=
X-Received: by 2002:a05:6512:3056:b0:5bf:b96b:2c75 with SMTP id 2adb3069b0e04-5bfd957c416mr7135190e87.37.1793881975197;
        Thu, 05 Nov 2026 04:32:55 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab170sm875824e87.16.2026.11.05.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:32:54 -0800 (PST)
Date: Thu, 5 Nov 2026 13:32:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <aux01NUd85PabtZu@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
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
In-Reply-To: <20261104194622.GC3889730@ziepe.ca>

Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> [..snip..]
>> 
>> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> > +					       const struct ctlv_cursor *request,
>> > +					       struct attestation_evidence_request *decoded,
>> > +					       struct attestation_evidence_object_request **objects)
>> > +{
>> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> > +	u32 challenge_length;
>> > +
>> > +	decoded->challenge =
>> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> > +	decoded->challenge_length = challenge_length;
>> > +	if (challenge_length < caps->min_challenge_length ||
>> > +	    challenge_length > caps->max_challenge_length)
>> 
>> Hmm, I'm not sure whether this check is required for
>> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> 
>> for example, if the provider provides two evidence:
>>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> 
>> might challenge is reuiqred for generating the token
>> and this would be marked at min/max_challenge_size in evidence_cap.
>> 
>> However, in case of eventlog, it wouldn't require challenge.
>> for example, TPM event log or CCEL event log.
>
>Right
>
>> Do we need some field on attestation_evidence_supported_object whether
>> it requires challenge or not and applies this sanity check per the object?
>> 
>> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> always.
>
>I wonder if we should have two interfaces here for signed and unsigned
>evidence? It would be clearer for userspace then when it needs to
>provide a challenge or not.

Isn't the challenge field provided/not-provided enough?

Currently on the introspection side, device-get op would provide
challenge-lengths array:

        evidence?:
          challenge-lengths[8]:
            length?: uint(..4096)
            min-length?: uint(..4096)
            max-length?: uint(..4096)
 	  objects[16]:
            blob-class: evidence-blob-class
            max-length: uint
            blob-instance?: uint(..u32-max)

I think it would make sense to have challenge-lengths array per object:

 	  objects[16]:
            blob-class: evidence-blob-class
            max-length: uint
            blob-instance?: uint(..u32-max)
            challenge-lengths[8]:
              length?: uint(..4096)
              min-length?: uint(..4096)
              max-length?: uint(..4096)

Then the unsigned object would just simply have challenge-lengths empty?
