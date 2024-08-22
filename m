Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1C17C217
	for <linux-coco@lists.linux.dev>; Thu, 22 Aug 2024 23:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724369507; cv=none; b=Bpo2esJqIxHvMwHYRCjWx6g3CPOEKPpKmh4kdTKaSWISCxDWN7PrJ8fxM6mVxkJZzL3lZ827Paa3PAbjkJWLMhY9WC29Gfej3Xt0BlNTeg+KT9Us8lA0T6nMuYVPLObBxIT40+NqEE5vax/pPPYDW1AKyvB/w7rddpwGQ3ibULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724369507; c=relaxed/simple;
	bh=BLP0/E1yn6PT0bUiz7FMfJaAX886FCAKrwY3F7vRFmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TYzH5HUKZTRrnYj271XCN2T/dma9y5G7MTWy4Afnf5Aw8qBi0kio2eWKrRH5upU330XoYAIuwBAE2sPOIWldb1aCbxpAZqONi/6WJqFm4qIMwdWHAi8xpU1efJKUpSvWYwJxsEspYlWp78O8JX5669TZlgGjn5uP/dFODvd3LSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jB/z+aZa; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jB/z+aZa"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6b0f068833bso37146177b3.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Aug 2024 16:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724369505; x=1724974305; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2VK4gsJnT9GBGpBnsDrs62KK+JLaRL75WIZ8QjWkPI=;
        b=jB/z+aZaxckKODYI7MOmXaECmtRQyn4OYED/8D+A3zfB0unChZ6URKA9xIgQDvowLW
         UkfZ8r4JNLkVwKSM8KLxlMStKUcP+e8nzEH2G+uiwHsJKgolrdimPJcukh5Y1TZ3hCTN
         LqRAaKpYM1X3Bs7abI2o1oi9RboxBgfNqu9cCaTdjLmCQdlfZZT1sLbtq+NwI/h6PrhN
         DEIpWcHUD3WTb+gLXh1aNnMRMnWemwpFzk1FoQ/dnpYBHPAnRI/RTaBIZoxUae/BvGMh
         qWzUw/5o8FAZL9vE0ZrZJYdSEMVQ6IKqEioEuz2TTyXV0NSZT1CBBq+ADPYbF1yG9ewp
         oEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724369505; x=1724974305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2VK4gsJnT9GBGpBnsDrs62KK+JLaRL75WIZ8QjWkPI=;
        b=WO42vasZpBwk1KzeyYUv4EodD3lZTRHcN/U1/ePaQ4tfuLZDlAhK0C75RrvrUC5qSv
         eWaq55ByDsG7xJwAHTNBGYiw4h9QP7S+D8cf/u2vwW+P8iBDcR7EQsBlBYZ/OevyPhsG
         qkjco9v9PM/myW/xQk6uKi1Tghvmfqsw90qvcFFjZ2meZiJ2zPrjDsxEDAfwJNDfjYaq
         2/Q24RpPEdpXQzsXuQWENAXQ6FUgJw/K8ICpZ0fZYuaYOM/g+GUhJ4uGQ8H8DdD6gzvk
         CVE2lPinSf6VKiu11QrUvMQ/wE6ZGrLtGhRqdDbJH9FthFpAhuh4iN/QuQT1QrVgqE6L
         iHTA==
X-Forwarded-Encrypted: i=1; AJvYcCUUIq0LXxhrlzuO1YZyZhb37KJRObokwXovrkeChGo+7lCnXk2EV5YLW37QTOLt/gD/idnqMppOxBxA@lists.linux.dev
X-Gm-Message-State: AOJu0YyOdIkllZoGCMulNAlKp7wNFib1JKaBNleG+6+ir35RZl8FAJTk
	FskpSRuxRwNEPlK3JCAdokyfk+eo9dkBGv5z9+UJzZ5pknoc5qKhXf0JJSFvx/ydQUFgkoJEaDm
	7fw==
X-Google-Smtp-Source: AGHT+IH1bSLgCDinu8YCjQb7w11nLcPVDULR3x9aSTV+XkWP7TA453YTQfvUWCeaQvVV9FvJlSUiOiG9JEU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:498c:b0:651:2eea:4dfe with SMTP id
 00721157ae682-6c2fd9f89d1mr2277367b3.0.1724369505385; Thu, 22 Aug 2024
 16:31:45 -0700 (PDT)
Date: Thu, 22 Aug 2024 16:31:44 -0700
In-Reply-To: <20240822221938.2192109-3-kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240822221938.2192109-1-kim.phillips@amd.com> <20240822221938.2192109-3-kim.phillips@amd.com>
Message-ID: <ZsfKYHFkWA-Rh23C@google.com>
Subject: Re: [PATCH v2 2/2] KVM: SEV: Configure "ALLOWED_SEV_FEATURES" VMCB Field
From: Sean Christopherson <seanjc@google.com>
To: Kim Phillips <kim.phillips@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, "Nikunj A . Dadhania" <nikunj@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 22, 2024, Kim Phillips wrote:
> AMD EPYC 5th generation processors have introduced a feature that allows
> the hypervisor to control the SEV_FEATURES that are set for, or by, a
> guest [1].  ALLOWED_SEV_FEATURES can be used by the hypervisor to enforce
> that SEV-ES and SEV-SNP guests cannot enable features that the
> hypervisor does not want to be enabled.
> 
> When ALLOWED_SEV_FEATURES is enabled, a VMRUN will fail if any
> non-reserved bits are 1 in SEV_FEATURES but are 0 in
> ALLOWED_SEV_FEATURES.

This may need additional uAPI so that userspace can opt-in.  Dunno.  I hope guests
aren't abusing features, but IIUC, flipping this on has the potential to break
existing VMs, correct?
