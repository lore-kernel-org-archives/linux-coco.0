Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD5493D4A
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946362; cv=pass; b=qVihQrH6xomVru1uIQEmsiUysxEYmcDKZ34B+kqZk4wFEXbE6a+jNj0+MjbTARj7LZfRuOAZNSmTMMPVeY9YWwTjatziQAlQQfNthzqEovrV4q1AuQ+qAcJvQ+WulFSYaAaO3+gZkwRPhc57ggKmz7/qeJwIKOwnt45V2FwaIP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946362; c=relaxed/simple;
	bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZude3uwPhaN42h5G7zpGiLjrVZuvRVBiOf9Adx0w2XHaeyqYoss6WMmCrqS6QuGMphHl74GLIO6yTeYSxos4NNL1nzQ4PwpKI6U7ep6cjbxT8qvwLyJjKKzCymebjEq/K+RKdd9qeXgznwlEYMEWR7YbDheAGkmYqN4m4Yhx3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W2Phv1rM; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W2Phv1rM"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba3d1ea20cso7125e87.0
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 06:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790946354; cv=none;
        d=google.com; s=arc-20260327;
        b=pS5vFOWWrMmAcUtNvoiGNEqW7lcdjAPF2apTWLUIDCTUTk1qbghBCEMdnSHf/mwo6E
         lhqOFGJuvUzWiWWpYH5b1N1GcdcoQMSOZ7UY9/4MYn6nsGGTC9OO3vfIXbd0Pey/nhKf
         AkMXCrelosyjwapdGNf1vuNqTUARzSaR02KZD7E5QYsrFsjqvyEoGY7WB4X2L/lB9aLB
         aRIKKzlB8/I/NQZ7jf4lHxHUt+Of+4M0ykHrHnZplD2z1a5Pi8BXgi+VXNcT6CMIo4AZ
         rC9Y2+K2DgzafVU6ULNZCFEWM1GWGBBm3Sk6jkpv/xcCroewftyP/7gDxrLHC0Pw5eDB
         lzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        fh=paYK8qm+Df3hql6MnjuuEj16iM1a2qLawtmvBmyK45Q=;
        b=Vr7LFC2WvT28LDmCCs1G9wdbBibkrN4laavBzpAhZ8UQwmuuG/pgRZocfg18g2MbpB
         bA8xqxclVEaoVCI/QHx2RokgNpc5HNAXV/liz3gqvDouW5kZv4jLtdANX4i2IyObxUpv
         O7U1wyAW53z2RawW0lOiYxulDYxsOqOEP6VhEieZKYRsDyv/W9w5CJGjTPJYyEnnx8c1
         o7nz69nQb2uMxyTBDfqHs4hf5OyDObp8lJrrdwLcjvnaDdKyJWGSe68nVyUV8c1vUJyl
         BQiF0xZHmlErPE+eiWKZUZejxMv4R/gjB1kKi7A79v23AmuEf4RiNUqDzsYpdY7igjDD
         bARQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790946354; x=1791551154; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        b=W2Phv1rM71oVjbA/8lnLfVri88gI1M30eRNn40Urn258q1MiUGNLN/Jcel+L12i38N
         YK2aI/VLPf682nbEUaEtM4iCQnSL+ga5QN8MVJauUCOS7bQ4Q6KVKEHRZThuUEEM4Ihq
         7yLETuOCmKW9xKo5bFk9kqRqBomvjfeBir1qmjVsS3rSnQtkR5t7+3DfSEdukWyIdpfi
         5E06ZW51I9oN/DQ14ZHg0PRAw6Cm9TJ4IwsIkLFeoy0yb34p5aOC6LxhBg7XAeEfpEgj
         vuffNPXOFRlB1EF1k4x8REg83cNTpOPZyk7UtQh4J2yfHVXodul6womhF0lrOAGKZLfW
         2rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946354; x=1791551154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        b=UbOIZkye7mS4dlJ2QfuwJKyO1Mfsb0t2v101uB1iDE43SmraG41PvJH89Vi85ZCmkq
         8XJnWMLCePbB4WR4sS+p0ihI6ksOexiHcT9JBh/3Cp3B+eUFM2WB7CzDDT0AmAXuC9fj
         mZOY94RrRm/7Buh7FhWLWpm22pHznvuQRQquxTYIwCiUW7fb9xsOFgwgDD2vwkZ/wIOs
         wFAf0f2EFQaqkC6cu+KmUfHZutk00IZqUTbczod78xOLhQoWrPRHyrKtSdcZOFdVCH7Q
         Fm/zi2qCEqfI028qxuK5/9abfmPUcVRt7rlWdjFc1GScednmCAkxVkLxjOO52FgUZ1j1
         E/Lg==
X-Forwarded-Encrypted: i=1; AKwUvBz/TNF0wC5PN976s1ez0wcVKzM2Dsbv/YIV8EGB1VaDYlKAowEg7xZ+k+Ne5vH4VBhXkCle8wAHqUs3@lists.linux.dev
X-Gm-Message-State: AFq9FYLzVcwUlURj7h9KXr2IDydAGJv9mOKqa+s82hKW6/PWacmmxF3X
	7dOQwE31i2VA9c+efp8YCpC+Xmr6sdpO4OEMg5eQd1lCZdU4/S+xRZog2SccWwJ0GbUHTCEeRnS
	e4TLdczp7SJogz0Cf1ddqPWFGjiNk2dil0WGKWbC4
X-Gm-Gg: AYBFou1326SIxJDlI6pQqonyuU3JKc47TksUemGG4kl/G0MXiiZ930AkqFuNTTmu2uC
	rPahILVk5DvWWptSV72XKd7szrbGbWwMHUUP/+G2T5m181SJVdymQQK2ogNzY0DZ+YeXBE8DL9t
	viQ3puVekiFjsQC+JrRjMJIPxWOF7o4hEkkg1GoZQjWDGbTMEiy2u4AzBSs99GoqWV/gjNjuBRg
	qm7dW/mEdsKhA0q2fFy4PEivf9HH5x/Mbh+PYTy8yx6Dd7B4I06mWeU1K0jSxD9UmqFF9LTEAx2
	fIGmskrEZlTcseemu0+MDoY7686YtUmwkveEpgRakIldbFJB1g6v/8MLAUN6xvJ+6FrDbcW3cfH
	cGHVoIKFUsnIq9g==
X-Received: by 2002:ac2:5b41:0:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5bbe07ff867mr111076e87.9.1790946353509; Fri, 02 Oct 2026
 06:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org>
In-Reply-To: <86se2o2rbs.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 14:05:17 +0100
X-Gm-Features: AclHuK-8Kjrfe19sfHmKlc-tMXZBvGMWfs-wEUp4fL4Zc1UtRtbnXSXF_N2l_2s
Message-ID: <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
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

On Fri, 02 Oct 2026 13:57:11 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Just to make sure. Is that what you had in mind?

A diff is worth a thousand words :) Yes, that's it. With that, every
remaining hyp user of vcpu_is_protected() only runs with pKVM, so the
kern_hyp_va() case in the macro can go too.

Cheers,
/fuad
