Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B5305673
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 22:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094884; cv=none; b=mUNf6/WNN6pAm/n47EXjA77K8qKhblj+9bOAhHEP+kXClFxeuBFnnwlDkWnHv2k/XdNCC91mWHRHE8ERAsp8dyDz/Z67ma0NMc2uKyQQDu1BozQ0X0DTNxTAGquBlutfFr1Yar7D+XgVCeTNBzHvSMtBQgbHGkcqnQNLNqGySv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094884; c=relaxed/simple;
	bh=5yvJV9vXWs5Qlzw+uv0eTkJliBEe9uWpc/mKLSSPMHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gut81VQD7JZ+Y+SPQufNSnrNZM/dtwBG6dZp+OiGbczz+eC3xqDfikhBIUW3wRi2RK2UunN/Yj5dDnmWjWfDyIxrcDjUcXtyi1ULbPtltpi2BSFSAsGoyA139oH3GyRuLS43Sij0JaGUUvMbO08QABOxc/LlxsvZfJDulxntv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wdbs8+RT; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wdbs8+RT"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so1187342a91.3
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 15:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780094882; x=1780699682; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nMvAa7KIZl5UGBqGRwk9syGpPQlY3akFZd5KbTiPRrE=;
        b=wdbs8+RTieoy3b0RUN7Nlv3H52y2bluB/b0bT0r1roNXlBjbnsk4AjQmKW2QMhIQrh
         OhZQDQe1iipSij7FtztNb9rV002B4BSo9M960tmq8d4pC9pmv21CYvycuqw4h8/Nj6eg
         iJxDN+A01WQgME4VaRMkNDjr2m47zDKr7VqlU3bCVsBdX5uINz5fF94qzgig6NVyZdvB
         yn4cVdD5wQWhk49f4ksF1zlPyrtynJLVb+aep70705LRrLs3x6bvLUEFiyTYcwSQmWkT
         Brhtvnc8VoP5OY89lyGmB0zAciWOnIklqltfJR6eLlSNOKvoVV/+Ohnmsyh6AhhYz/Ye
         De5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780094882; x=1780699682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMvAa7KIZl5UGBqGRwk9syGpPQlY3akFZd5KbTiPRrE=;
        b=WD5jqqZ5U50NTGzHn4jACopGxQOH+HRtmaB2GfH1LdQqbS8z5FfbG+hEZ3S/ePKuqS
         KvNiylbJkkMxYeNFhvfIYZuwMPZBQCy9ZEp9ZuMTvNnutp1C91sFzxSHNYevrpvbNXq7
         7h/DqYpQm7/kV/jAGT/vu15/IZcY6p2cdDDIeFas8+HmVjPYIF3kzgxccIl5tjOSJOJL
         7YjtEsIfakVMslamefC3iSKX1ubiFnyQVp4s4vrfnfao9lnWeFAUGCrI/AbFah+91g05
         IXz8XtURfuY7NXcfP4C1W8sgKwO39XxbgphqxMTHmQdVu4BpyK/ZZfpmS8DTkA16ABBY
         z0gg==
X-Forwarded-Encrypted: i=1; AFNElJ8hnRZ5t4Ld8qDxtRorD5iEHg1Td2rOJwLaTN99h5Zon6EJllf017mUNVTOjl8D0VVtcg6mzWolDt/j@lists.linux.dev
X-Gm-Message-State: AOJu0YyuSKwRHRDRwGjj86MzRfdjL6ctYarOgDpBA8ICur6G2paXpfp4
	kXufzsEMha+ChdHWTwK3IZqZDWoFgl/Tummss4YlcUXMEwFSX4rrdEmxgnTLXDTgICNVafn22QP
	yZzFjuQ==
X-Received: from pjl14.prod.google.com ([2002:a17:90b:2f8e:b0:36b:be8c:b289])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:590d:b0:36b:b3f4:d574
 with SMTP id 98e67ed59e1d1-36c68482266mr1051017a91.25.1780094882058; Fri, 29
 May 2026 15:48:02 -0700 (PDT)
Date: Fri, 29 May 2026 15:47:48 -0700
In-Reply-To: <20260305222627.4193305-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260305222627.4193305-1-sagis@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <178009462446.880124.3655213722533116309.b4-ty@google.com>
Subject: Re: [PATCH v4 0/2] Extend KVM_HC_MAP_GPA_RANGE api to allow retry
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sagi Shahar <sagis@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Thu, 05 Mar 2026 22:26:25 +0000, Sagi Shahar wrote:
> In some cases, userspace might decide to split MAP_GPA requests and
> retry them the next time the guest runs. One common case is MAP_GPA
> requests received right before intrahost migration when userspace
> might decide to complete the request after the migration is complete
> to reduce blackout time.
> 
> This is v4 of the series.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/2] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
      https://github.com/kvm-x86/linux/commit/3e2dec1ede0a
[2/2] KVM: SEV: Restrict userspace return codes for KVM_HC_MAP_GPA_RANGE
      https://github.com/kvm-x86/linux/commit/5d40e5b49442

--
https://github.com/kvm-x86/linux/tree/next
