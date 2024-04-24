Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425911598E5
	for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713963984; cv=none; b=uqHOgNQvtt3EY5BGaNamNFAq8CirtaZGupOlkBXDOwldXGbqEVg3TB1lZw9q7024G5qo+rtQB3T/UVhY46DynFlVxTLvOZii4XDdExWejlQ1q3is7sZdpQWAoxAMi5EzimjHqIpz5K9owh8NNNfqxL8JoMyuNkHf6q9s4ZFeHCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713963984; c=relaxed/simple;
	bh=1X/4OOsHJ1KCbUAws4NmpoimMT/p0DvtpIV8MG8B394=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrRTDttvqmK6MWzJnEeroyolB3vmcJVlXY3D0vVPTX3rKXButY8pVeda5M02xgBNJzRB6qktvwoO8gYj1oJxVOD4D7ctjOYvWQpF7t2WSCwVz17btbdM/h0KFQI7ecoggdfp5SeGF/nikDKhrFrc1rXWtdPFVrj6fTAFMHcj9ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMrKFIll; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMrKFIll"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51b2f105829so4803368e87.3
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713963981; x=1714568781; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oXPDyQAT+HitFMuQv0udxwIiXElf7T1dd2oYrE6rTrM=;
        b=zMrKFIllWFQgeRwxSKLxtlw1dbsX50TMPJDeYGdk7S+3nmylVcjKtcTEjEHRw2RFS8
         GkGL/Mm1CpRfP3+nVWZABvvsCc27KIWMYitawTeh0w236rpvsNjszV7hBm4WVjBBmPUc
         ePc98jofq4JfnnqWT3/n4ANduuGmO7PkYWxZVM+qox51VtYp9BfODg4NhiM5VpBoZCPA
         pnY3QwquPxTD6IbGWYyK6pHk7/lDK4WmflG4IwqnjB/lvpo5Dc6b467Sp3e5oCiineM7
         RvWgOvDH8osYv43ZCMUjnNo5AospBDAJRswn1zuagN8fBcYPIzcqq+a8iL4zBS3vxyVK
         oe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963981; x=1714568781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXPDyQAT+HitFMuQv0udxwIiXElf7T1dd2oYrE6rTrM=;
        b=tIhXfD1Rvxy6xP3kjE5uIZku0fOrdbidhqFsTXga0AM26crOMKdTFE/5UWE3ApuT5z
         C8ka2l4/hxhLV0nJbvZkpRmWrXP3stQcOcLeL3lhhLbULNUz9rk1snkyIs1+4HkgCS44
         SBhgkSXpWXnTQD2u3/pnpnI3hcE9KQHGnA0fOB9DQkz22psXnrXSzL7kMu1us3Ci59bg
         Vr98hv7n2HYAHXvIBVxIEgDu0gfbYD7c9IkR6BDmuMYNGcqaxCo1aeWdWXGK+qapUt/z
         FwNQNn4oy2b+FJ5fF0NcX6JMRG2wbFlHKdwZhP4ToOimR7b0CF+ILmiIIIDSJ4VdqWI+
         YOdg==
X-Forwarded-Encrypted: i=1; AJvYcCUBu20BDs4NGq7fctw7II0kRgllydz6kP0jdDrryL7Il4lfjrpW3O6sYmdOO/BfedICEhPTv0CqhuyzFyKAQSR5NeIBe0eL0BI3Xg==
X-Gm-Message-State: AOJu0Yw4VR2kgjS43RCJehzJ60kA2Bu2fi/2oEpyPYqntvwSCg/GP/x4
	GRrm1ASyEYg3f4xT/8e55IwRKCcjVr4Fk87VI+zjvns/5IRdUXMwztWhx0Tz54zXgf6ppLzeDQC
	MBPKAVFO5OMkgguUTjtfVXPly48wZOBWfs7FjYA==
X-Google-Smtp-Source: AGHT+IFefKvAYRBqhr8QCesj7hq8WHWt10BLztHIAMclGVcycqHpNCSNgO9jv0EcYEOBsbpQ6CS9FIGy90LZsASyIU0=
X-Received: by 2002:a19:915b:0:b0:51a:f31f:fc6e with SMTP id
 y27-20020a19915b000000b0051af31ffc6emr2425780lfj.14.1713963981412; Wed, 24
 Apr 2024 06:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240412084056.1733704-1-steven.price@arm.com>
 <20240412084213.1733764-1-steven.price@arm.com> <20240412084213.1733764-15-steven.price@arm.com>
In-Reply-To: <20240412084213.1733764-15-steven.price@arm.com>
From: Thomas Fossati <thomas.fossati@linaro.org>
Date: Wed, 24 Apr 2024 15:06:04 +0200
Message-ID: <CA+1=6ydMVk4Vcouc2ag8G7tfqZy80VWFxWHSHEKF1JaABd=A7A@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] virt: arm-cca-guest: TSM_REPORT support for realms
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Sami Mujawar <sami.mujawar@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven, Sami,

On Fri, 12 Apr 2024 at 10:47, Steven Price <steven.price@arm.com> wrote:
> +/**
> + * arm_cca_report_new - Generate a new attestation token.
> + *
> + * @report: pointer to the TSM report context information.
> + * @data:  pointer to the context specific data for this module.
> + *
> + * Initialise the attestation token generation using the challenge data
> + * passed in the TSM decriptor.

Here, it'd be good to document two interesting facts about challenge data:
1. It must be at least 32 bytes, and
2. If its size is less than 64 bytes, it will be zero-padded.

cheers!
