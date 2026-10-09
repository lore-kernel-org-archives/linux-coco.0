Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1562749DB8A
	for <linux-coco@lists.linux.dev>; Fri,  9 Oct 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540695; cv=pass; b=RCO3jovnK0blh4sOLUsU+KInaliuq6IOAGYTy0vIcHxoilnlNUkSGx09qW1V8mBu+btHN189lGuvCiwgPgUkfyBrUf1x10X28KAT/W07Rw8dVMpcmBx2AUJ8PJup86p68yVtiPg2lT1Yp+ycF7r5Xmi4I0YqVS7wZCyKgsBPrZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540695; c=relaxed/simple;
	bh=jO2JB94/A3Hvfgi2+EqsO7+q4h2Kbsj1cn+DHY7QLyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSYIXBcPu04f+Rs+gD1dWDDdyMlTppDOjZD54coXp3luQa9AOo3Wgx4NWsRPM8SJsrrMTJHVO61RyF6MLf+bkqzt+0GF4/noDx2KpvapCxxjrUK0vbIPLBt52QA+QYP+Rl4NW3qTm55nKPVTnVvBeLCL5cWskDK8ILhEbDkWeak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPT+upGu; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPT+upGu"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6867e87.0
        for <linux-coco@lists.linux.dev>; Fri, 09 Oct 2026 03:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540692; cv=none;
        d=google.com; s=arc-20260327;
        b=T2W+S+wAUqaRv67wgkBUcpNXiWZ6bFJoNBJrvZvPv5ciuD41urRbd6Zhg7/ZKeaebi
         wnMNK4sGzrImfhmwkOxC/cc8wB1jxz6MwNZ9P5MJFckcCgqgstGTejPPF+FFlVtc7Cwp
         4uOPjM0LXb9Bv4DpJC65KD5h7ef/XvfkB+bS4JD0jOssvILtFlvz9JHnXX6ZrDQjyNis
         dH4JHe+u45yjjaNUHu6IeihuzFdQKCUcsdhnxkUzjUqw/jBEQgQ4KCENDK3nJh9AkQZd
         1w/o/4TdOWJjUX1hZUhPnxvJC6kFYD76tHtCKilbZCkhbLBBMOycviwCOG5h7FUKdNFn
         hW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        fh=dlGVp+jdI3VWf2e+GvG2g4Adus9rOwKqonQ4cf+SnSs=;
        b=C6g2OxzACF6OCIuHu8v8Go0BM/18ybaKac4tHdITYjO6RtfgYUdGzAUxgSmsOkda99
         DLwAlb/BkHhgkdxw8f5Y8FkdvFFsOZvuEvwdOKaCXDA7BKK+sMV0PbA1GviQrUMT8m/N
         RQGf215guN2tGS7PcXNdZM96XaRSSZH3G+hry2rWqoPIHPkyQKgP5D55on1yf7Ti76Gg
         QQWB+H1/PTFMy0NsZYj/Aj208mutlxBVYBrpr9H31rvuWJFep2Wt+wovqOcgrdfFbt/f
         QZQOfLnaqF5fsJAaZwp7GlgeZIm9Ti1h8yHI9+Qm3UKdXg0N+bOlZA7p484NJrVpMauH
         7e8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791540692; x=1792145492; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        b=aPT+upGuOZ3DCgP0TB6ThF6AjLajXQ+i+kHVc5s7CSn1oYh8pS3mTi6yq84MgRV3ix
         sWp5vJvKkyQ/lQ11HQnSOhBdI4enWmMawBRfdaYYk26+zeK7cbDT7h9SqQnolXaVevFw
         Wq37Ddj1b3Rj4e81l6FRwezvuJWH42jxXAoelUf9fLfME5zmjLvMIJviAVqSphugD95M
         r7y6v++8nvTQbRdohHhHa6JbO/1TzAevJftVfxkpe54XyZ5VCTvLRXGAUXvL68597VUR
         Jr+72it4M8Z70RNkUMZGXUSAJfdceKkYNntKWxJCm/52RDSSkZLJMtl2UZQq6UrFKMrW
         gNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540692; x=1792145492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        b=q2Uag/f4KdQwlyM+rwXxZXgQNt0DVJiu5zrK8VYmxa2G5F5hp+6WKwLLHJ33HX3574
         Db3ax7VRezi/Thin0TMU2TSgoG4f5W1V8ggZ3Dfk+M/upe1nkO2lAZ/uONAOY9rhnGUg
         3w9Frxka6wJwchAatjB9Jxm+FrLBn5sBq8jVjpYzhSdX+w4X29baAIis0dKQa9V+SjFS
         pgyFDFrxcYICPk15vizmKKauVqUnzoCTAI0WFKBuIInW3kYCWxz3LMjoszFk6Jkt8wH2
         fCsf19x1U8g3jqR7QNVe98dl16o8d4poo2d7ABCbbrliHRcb1yV26t0nFWfGNZ9m7CKj
         1yuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3espB0SBM1FWKXLhGw0d6UC7a+v4byVjSWzvtTcl1utKysWX+OINCU7o1Uoky9KQGXueoIOCdj4Q9@lists.linux.dev
X-Gm-Message-State: AFq9FYLe7gUjMnHc9s3kMEAoUtiyPNGhglnyG4OMzhtXo8kSrNrrB3cD
	rkNNW4FgP6nAljeqrspQxUrvc/+GaJHXlV7gp74kOu7b8BVpe4GN6M4mmaf2pqdTp1lKUOylhIT
	HTQuNGRtxR00aWrJpkPA2ktNowV95xur3xNlja6bG
X-Gm-Gg: AYBFou2noRYbMLo0a4syaBnqUgTFde8fLptaINJSyAiGDmTxuJi+wHTeZ+4Mhe6oERp
	6asKBeg+p1kjkF7pANDavdKhwO22ekSqg4gf2wETFmq+rTPhMhHOMbBpTLzHAuX9tSlMywqG4b8
	HNMVYm/JIO5gbXZp9veTWcxaQAerhCzD/6ouEvEqA55vh5oNQBKpMl5Ps7tRTzQc3+YCd9mC2Qa
	sTMY0J7vbCKTGuBppfPIivMlJ9mWBkhWBXM3v1PKvoFGHloeAYzMzCkJNrMwH0Bs/3QST+uy3py
	cZIUpAkr2gGU86C6sEMMA2z8EP7+dEQUMZu9AA9G8BDQpmqe24tX4Bm5+CzHmAeJHSDYPA3pk1b
	c0PEOLVHFY9Qxrg==
X-Received: by 2002:a05:6512:6619:b0:5ba:4293:fa55 with SMTP id
 2adb3069b0e04-5bcdd5286e0mr89466e87.3.1791540691538; Fri, 09 Oct 2026
 03:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-15-suzuki.poulose@arm.com> <CA+EHjTx-niYPnnRDvAAiY3MXLpSYau_PhiBTCiE9mOYUChASPQ@mail.gmail.com>
 <86a4on2qxz.wl-maz@kernel.org>
In-Reply-To: <86a4on2qxz.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Oct 2026 11:10:55 +0100
X-Gm-Features: AclHuK9LIRInATLITNjOUiJu1KjVGIe10ULmW_HxdmRBfJcwxXlgGARzP-Th6tA
Message-ID: <CA+EHjTxZM2kEtsG7+pq7zygA8Mhwzai9PL7+ex1K35BPVSt6hQ@mail.gmail.com>
Subject: Re: [PATCH v23 14/14] KVM: arm64: Prevent unsupported vcpu features
 for VM types
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 09 Oct 2026 09:55:52 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> A rebase would be a terrible idea. This thing *must* go on its own
> branch, and not depend on anything else.
>
> I can however fix things at merge time. is something like this what
> you had in mind? It compiles, and is therefore perfect...

Yes, that's what I had in mind, but please keep the PSCI 0.2 check
from kvm_vcpu_init_check_features():

        /* EL2 implements PSCI 1.1; the host must not dispatch as 0.1. */
        if (vcpu_is_protected(vcpu) &&
            !test_bit(KVM_ARM_VCPU_PSCI_0_2, &features))
                return -EINVAL;

Folding the allowed set into the mask covers the rest of the block you
dropped, but a mask can only reject a feature, not require one.
Without the check a protected vCPU can init without PSCI_0_2, and the
host then dispatches the forwarded calls as PSCI 0.1, while EL2
returns 1.1 to the guest.

Cheers,
/fuad
