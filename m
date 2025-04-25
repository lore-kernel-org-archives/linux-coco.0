Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0152973B8
	for <linux-coco@lists.linux.dev>; Fri, 25 Apr 2025 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745623426; cv=none; b=jfHvP+9pD/y9CoBFEj8JmS5EudM6PDeYVZxnKpF9d5kDjPTszbg/ggHKv+b601I5LnAxneZJBKQNbU8szFa5XsNZq5dcmMgnV6SJg42JqpR5MOyC4N1bnm9GTkQhTENkkL2Fvy2qG11ZGsS2HyC3kKSQUPWyu3wb28uHuzzLsVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745623426; c=relaxed/simple;
	bh=W/4u0lOWc81NccjcB9uXLRxjfQvmJccU9FvvMv7UnLY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=if3Gdo2LwTL83rlTpHPN38X1WvwU+VUeZYXSzOv7YxfX84Uwzy7uNJWzlOaFfZSKHHTHAUziOAzuh1Ee34kReKq7DyUiD0D4YiW9Yo+JaUZtr2tilPfQ+fKVHK47QoBuIyfEfvRJgI+Ml/CcAwxnnlSgUx8Tvtr1pUvhuVj+scg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CS92i6Yp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CS92i6Yp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-306b590faaeso2190506a91.3
        for <linux-coco@lists.linux.dev>; Fri, 25 Apr 2025 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745623424; x=1746228224; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iS6vvTC2BG7KBzpZ2hrMru0/r0uhvHtjUyGqFDzSlk=;
        b=CS92i6Yph17QxJ59vNIp2+36z8TzcdnYRwoU95fh/+iU+214S9rpnr1z3XfpWOPRQi
         EguMABXA0OKvYBfxx/6HZS63DaWsB1A8wKUdG8aYsuMkreFxiGi+0q+xLbzupGND2zcP
         MTMgx+LYOzv2ogGZYRyei7yvP22cjovjAPzzm+vlYCCpvtqd3HOdf+z+gGUqOqgNT2Wr
         F9zeEO8U3HSqj/0KVtsNrqZO08MRFHh7VnHYkYMk1nZmg2lXCB+GheYrdDWCt/5JRl+G
         mWIzMNkv+EBeLv64ijwVgHynTvC86Z904Idlu+MNXA3nnvDNoaraY7lKWohN4KU7lqCd
         0txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745623424; x=1746228224;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iS6vvTC2BG7KBzpZ2hrMru0/r0uhvHtjUyGqFDzSlk=;
        b=urdXaqOoecy6sE4S++X7x9ENoBmQ3KiIabxpN+9vvn0UBLjImbQJUjXbYv0JZB9x6B
         p62gZdyoPPk5C59yL/ku21HUcHl8WX0zTYSRNK970aNqgHNm0bKgSfxM+LeOCi8yOsHH
         xahVLxZjMrVDyqqfLFrHue5jiCsG0mA8RIHcrOcBexRJjZyfv0glmR7rHuUwp8khCFX6
         BPsCf0XGz3cKHKPYC+AkBCBRiwf5WHFVi7bb52eVpKc+31r3ZNdofgqI3foHMrhdd1l0
         jzemFyqLtkQ2eU/oPBUZl4cYg2BehuJJ6gRgHbuGSzjzlKb5JRej/v65C3QmKk6cgPgb
         HAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWti8pAbaWrlQvwwBfLbE/61AX+kE9ueq4Zbp7cpi6junDu2rserLjMhc3p3s9fZrX0qrP3C2BFxM9I@lists.linux.dev
X-Gm-Message-State: AOJu0YzOqC9gchFJQNnjAt2a3lIpzS0XF7tvPEc2J9YWUeB6QrASF7r9
	hBzEVQ9KJib0nCPhs0lkdn71aQtJqyw1YfCLsYc8zQYt+0aEPIp4z4ESvp4Nfqvz/ijIzYufJkm
	Lmg==
X-Google-Smtp-Source: AGHT+IGE7Db7SsvC780U6iZxFCfU1flMB6i6zwPX8CAN+B1wZoleiriiDrI6HnQqyvwglWB85GjmXPxrcrM=
X-Received: from pjbsi3.prod.google.com ([2002:a17:90b:5283:b0:308:670e:aa2c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2544:b0:2f1:2fa5:1924
 with SMTP id 98e67ed59e1d1-309f7e60a39mr4757679a91.26.1745623423952; Fri, 25
 Apr 2025 16:23:43 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:23:18 -0700
In-Reply-To: <20250310201603.1217954-1-kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250310201603.1217954-1-kim.phillips@amd.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174562133546.1000664.8086467435503867991.b4-ty@google.com>
Subject: Re: [PATCH v5 0/2] KVM: SEV: Add support for the ALLOWED_SEV_FEATURES feature
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Kim Phillips <kim.phillips@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, "Nikunj A . Dadhania" <nikunj@amd.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Naveen N Rao <naveen@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"

On Mon, 10 Mar 2025 15:16:01 -0500, Kim Phillips wrote:
> AMD EPYC 5th generation processors have introduced a feature that allows
> the hypervisor to control the SEV_FEATURES that are set for, or by, a
> guest [1].  ALLOWED_SEV_FEATURES can be used by the hypervisor to enforce
> that SEV-ES and SEV-SNP guests cannot enable features that the
> hypervisor does not want to be enabled.
> 
> Patch 1/2 adds support to detect the feature.
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/2] x86/cpufeatures: Add "Allowed SEV Features" Feature
      https://github.com/kvm-x86/linux/commit/67e672eb2e89
[2/2] KVM: SEV: Configure "ALLOWED_SEV_FEATURES" VMCB Field
      https://github.com/kvm-x86/linux/commit/51c4b387555d

--
https://github.com/kvm-x86/linux/tree/next
