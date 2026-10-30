Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368311;
	b=t0vPfUG9sOWtvyufSqJNlfOBC0uOifofsMKobxcotGQP2S5uPmrgxJeCHSgbMRQuY123
	 6RFxGrCvNLR5g1h6M60DIeVbDDfLbx7WV401vHxOVNderaQO+PP5AXPOPkY9YKD+CLz6A
	 q/LcVQhMHxAC6sgCQxHBnmkMgCQqKFgpKkte2E8lF8ZNXCm+RE9HjyBN+NgnSND8iveUm
	 bNX6dBVWrDTDtOpKlItF+qY1vcEQv8FYcU5Rua9lpD5snuW0CEDUI0mZjgr9po8mCahs5
	 4e5jJqu7sPiucCvpGD/vzCR2Dr9iBfNque1p8xWu97QZnVjcLj1MShpJOtgGfNjR9ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dYlx28FnHXYVTNT5d5cFUC7pVscgu04N4TsPgFJfIQI=;
	b=cCSlA5MsC1wmAvlDQye0WDQAy5MnmfmqnkZD1TZHZMBCbh92jsTuiGWVXD8VfpTA1EyY
	 dQ9gE7gwqdTiIcw5f5pwAyjae0VNHOA9HjNhtCTTICqUsKzP8a9oEBfRF3pZHMwlH04GL
	 mTdOkzCP99VCvOY0ofTb2VRaFZDndqsmUP5Nn4y0tGAXjTqpJd79QMxg5nvES8RZKNSzV
	 UoRwl46pitxYhVhUNlE6lIPOAgy8sRI4MSSQxh/zb6yPH5LFk3sXRSM/C0lX1lX4FcXyx
	 UtZ+zNN6yOL13WyujEYKp/R1I0EqcMO04rICzvjCKwEOt8nc3xvfT2E6BoKlNvUxd4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=n84PV2b6;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED860A262F
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 13:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73ED860A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=n84PV2b6
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a595487d43so6823041fa.3
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793368303; x=1793973103; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYlx28FnHXYVTNT5d5cFUC7pVscgu04N4TsPgFJfIQI=;
        b=n84PV2b6i0cD8tLWkOHi7BgaMKTGzO1pjYSKl9IKWqtSIEjvEQCmROtdDScunnEhPg
         UXHn/af9TUnoOtKdKCg8/AbcEHGpmFXgoaLG0NKKCIMNJMu0PMG4EPIzOEu4KD5wo54j
         AG02Zrzi2Nzdx6L/3ictyt/Yw91xPwbiW/zfbUhmUP3kj73h8N2NeopmSwwhygyDdthd
         ZGzo9ic/nSVzgzd32T9byfoaBwlIyNUOM/Y0iGVDz69MqLDmZRTfMAjRbOWv86mxu8Na
         hx4ddrHRPM0IC9pMzdfXWw7vHAWj5KD5FGew2XRbMS92+qEMUyKgjDOBBfAeV1navnvn
         Hirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368303; x=1793973103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYlx28FnHXYVTNT5d5cFUC7pVscgu04N4TsPgFJfIQI=;
        b=sCHVlzrsobiXVKEqR7nvGJeyvn3285IACFqmGRmIVK2X3fOiPZy4LQ7xkz6xEaYlvN
         DBfJFmqmvq7AsutVgJNgSza1eWQocetL4eEWRZJxpM1jL9ObZGfgbBw7vDAoYgyrYtx4
         d2Wm3MMhaVvombeF77ZAfTwNZXsMIezMqrZJ2CFSA/QvG4BlNed4ViNlnRydk+pEeRNc
         lALz2NVISjtP9QOW+QwBcXcbEKn3nZ5pKEoEuUo/6PAjoihpyJnCah9LswkTj37u0SfS
         fXfdj+X/wXtPtGWkynaMXGp60ppKYlLL0jlbEttq1OoUAqf3DbU+zMjoRLC5Xo9zsqlC
         MRhA==
X-Gm-Message-State: AFq9FYJwDdz11OR0B1O+lCGh9jg+IErknMgXX+L+BcsRokVZh1o03muX
	rTCO1ehSBgb3TeJTyQAS58yDfE4u+I38LrNyWSeTuZbMFnH8p5XUKWGVd89UFvvgzT8=
X-Gm-Gg: AYBFou0Ot6dcNFncTNtzo2FtIu2m0zjcaITieYlXzz5bpDo20OwJNA7Kub3Tgo6Xsz3
	+rvdZHmP16yKqbNFH7wr5n8y+UIJQRjZPjfWf3WWsWSGLnJRroE2W8PNAtUK7kaIM6x8FupWK42
	u4IMig7VMvhPPaPUtmosIGeQLZQUdc2sq64ThAIx5mL1rC/PK7K0+rjOLHo5EbTtYpJeb7owadP
	luFJ6T5kT5AqmeAgQdUrFXwa4JV5zmQzQ02p3nmdR+JJ7B8StubsaKo2tC7/DP58WbIj0fwJk+e
	+YS3ew66/vob038iAYFIRYEAliSC7eWDI76VNCl6GJIfcJSzJzYGpI/yTyLbVa1SJYziJaDx+K1
	ui/dkXhdGy5hm7Xi/FV4345NCNSikvV5tboCwVW/P+9VBsIDqgFwTy7rHy2AlA2mUm9SOB3aHub
	P/B4tALfHOSwcZPOUsJo5u4aXqi+CHB/k8GjL+EL4nXH/cS3ZUuxv0a1Wcn+OTB8s4WrGocMVQ1
	Q1l9mBcnPs/7u93zXCnaRN3aprlZi/Ps7lpxkwVetHqqOxhSR+Y2YNoy0uGbtPjzAE+YVuL9W5Q
	9wbsuKg7IJtfWu8I4dYYFpyPkEDtw8K2JDrbOw==
X-Received: by 2002:a05:6512:3989:b0:5be:494a:8803 with SMTP id 2adb3069b0e04-5bfd9575993mr960212e87.40.1793368303378;
        Fri, 30 Oct 2026 06:51:43 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04ee1f6sm167e87.11.2026.10.30.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:51:42 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:51:37 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 03/11] attestation: Enter secure operation when
 evidence is accepted
Message-ID: <auSfroz-gNb62nMG@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-4-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261028152618.1356860-4-aneesh.kumar@kernel.org>

Wed, Oct 28, 2026 at 04:26:10PM +0100, aneesh.kumar@kernel.org wrote:
>Use EVIDENCE_ACCEPT to enter secure operation after userspace has
>checked the evidence. Check the referenced device and evidence
>generations before calling the driver, and record acceptance on success.
>
>Remove the separate DEVSEC_RUN command and callback.
>
>Keep DEVSEC_STATE_GET so userspace can read both evidence acceptance and
>device state. Clearing acceptance does not undo the device state change.
>For example, with the following PCI/TSM patches:

Note that the published wip_attestation_all_1 baseline still
has DEVSEC_RUN. I am planning this merge into EVIDENCE_ACCEPT for
my next revision, which is not pushed yet.


>
>  Operation              Evidence acceptance  TDISP state
>  ---------------------  -------------------  -----------
>  EVIDENCE_ACCEPT        Recorded             RUN
>  EVIDENCE_ACCEPT_CLEAR  Cleared              RUN
>
>After EVIDENCE_ACCEPT_CLEAR, DEVSEC_STATE_GET omits the accepted
>evidence generation but still reports TDISP RUN.

What exactly is the clear good for now?



[..]


>-int ctlv_attestation_devsec_run_action(void *priv, struct ctlv_op_ctx *ctx,
>-				       const struct ctlv_cursor *request, struct ctlv_cursor *reply)
>-{
>-	struct attestation_event_batch events = {};
>-	struct attestation *att = priv;
>-	u64 device, evidence;
>-	int ret;
>-
>-	device = ctlv_attestation_devsec_run_device_generation_get(request);
>-	evidence = ctlv_attestation_devsec_run_evidence_generation_get(request);
>-	if (device > UINT_MAX || evidence > UINT_MAX)
>-		return -ESTALE;
>-	if (!att->verdict_recorded || att->accepted_device_generation != device ||
>-	    att->accepted_evidence_generation != evidence)
>-		return -ESTALE;
>-	ret = attestation_evidence_validate(att, device, evidence);
>-	if (ret)
>-		return ret;
>-	ret = attestation_preflight(att, true, false, false);
>-	if (ret)
>-		return ret;
>-	ret = attestation_events_prepare(att, &events, true, true, false);
>-	if (ret)
>-		return ret;
>-	ret = att->provider->devsec_run(att);
>-	if (ret)
>-		goto out;
>-	attestation_device_changed(att);
>-	attestation_device_event_emit(&events, att->device_generation);
>-	attestation_evidence_event_emit(&events, att);
>-	if (!ctlv_attestation_device_generation_put(reply, att->device_generation))
>-		ret = -EMSGSIZE;
>-out:
>-	attestation_events_abort(&events);

As this function performed generation preflight, advancing
device-generation, emitting the device and evidence events, and
returning the new generation, I think that this bookkeeping needs to
move to evidence_accept function.

[..]
