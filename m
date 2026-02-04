Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537B286A4
	for <linux-coco@lists.linux.dev>; Wed,  4 Feb 2026 00:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770163869; cv=none; b=nLBmdtZpA9gqhoQpu7tuBV9AD+uXd3/jvEXG6VPLu43trhcBTni0AdJbE5WagyDn5ozQ6oDAEX1dloAyCQo80mSMFWGT+piiAwPVFtKlbqRRWCNAIM4e2IHH+PbhOs6EN7o/7Y6QDPlq6TfKPcv1Lu5ikl6FxjG7VMhsLKxL72E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770163869; c=relaxed/simple;
	bh=ICObr3RXNQrcT1sXSqfxJaZWh1NvVxjHGslDwmmumOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z+0cLjp9S+TqkD+uEuAZeGUZ1ohhZb6Z9ZtPwd3suyL8jOj4W02orL2HSC1FCI5sMwucxdpYJxyUsQh4YQWByk4nsO7PmzORB8dhcTy5dP66vZVKlj54ClNZfcY6alu+chx/WGFiPtEv7+Vlw+phPFZQYYZTqA4RivaeJklguOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzi0ZvRx; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzi0ZvRx"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a76b0673dcso61480165ad.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 16:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770163867; x=1770768667; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYwGkq4tvz7SkzV+rZAFA2QLwjBHcMshI0mHagHtwiw=;
        b=dzi0ZvRxA0OZf9I9OgHeM+a2DGjWK8UwLjEFz78RqKbLCs74aLLfyZDtxGihv2QGZd
         MsaJuIa3U9er5K0YUt+FgfChU2IF3yWHWtav2Nq4ZPP13Lb8s+pvEb4x1AHHviaym1Sr
         XMGthZ3V4NnH3X3yUEUeOqzd3E5gHvyR68RHa+NBqN1VeOqESYDmPKZEdIuONE0fuBjV
         CvUCer87x0E7v/1sCxHDRYeZyGZZ9eawfEegpyaRSPIdeWXvKnJ7OQwe1kOPPM1ShtZs
         zq1jvl+2u/nNEyn6fbaWtPfc5iamu2z8DkKiAoLHXrXyg0Rb3GNrJl5NLUpXl86nBo3S
         1HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770163867; x=1770768667;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYwGkq4tvz7SkzV+rZAFA2QLwjBHcMshI0mHagHtwiw=;
        b=S7fvNs/OVvKYtBerirNu0PM+25KrvJ3El8YR9uyYrTJcyVyzC1KkuuwFr3+7P3XGLI
         OaNj5hkKHeNpPfUFvSq9gJdJMNG1Rg39ULJV0KZ4BCJZ+bkm+UDSoDnGjHUV0o8GdHNB
         lXF6UV7B0srWsV6AHeJu7VQ8JZ1w97b0uYXBAp58iLHYIoVvKp8TQqTXlAqeXXtFPoHB
         oUvmPJA3BLmyd25OLJP5gHG7v46eAi026C/0a6M+dWEzcuc4ratvEbY34QbXg1yVytxX
         2D2wVqbtmNd3VdiUsjyS6nE9uL3V+6afIpvgndw4RwPPYFhkB73eqiReVuWorYtkyGWY
         u31A==
X-Gm-Message-State: AOJu0YwJBXlTLAjTYb59CV/pWzy+faEqhbdxUEAL9fn3n+9N063TBDqb
	yVk3QD3nCyV1w3JS+S6+04/WoabryrODmgOtmc8mYMGoDYrgaGtAxMbYHnI8bSGhIRjMKHurcO+
	F4J03rw==
X-Received: from plgw2.prod.google.com ([2002:a17:902:e882:b0:2a9:1508:533a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:191:b0:2a7:8bf3:5677
 with SMTP id d9443c01a7336-2a9341371b8mr9635655ad.59.1770163867558; Tue, 03
 Feb 2026 16:11:07 -0800 (PST)
Date: Tue,  3 Feb 2026 16:10:27 -0800
In-Reply-To: <20260109231732.1160759-1-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260109231732.1160759-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <177016365652.574271.13292347664843792807.b4-ty@google.com>
Subject: Re: [PATCH v7 0/2] SEV-SNP: Add KVM support for SNP certificate fetching
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Michael Roth <michael.roth@amd.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, 
	liam.merwick@oracle.com, huibo.wang@amd.com
Content-Type: text/plain; charset="utf-8"

On Fri, 09 Jan 2026 17:17:31 -0600, Michael Roth wrote:
> This patchset is also available at:
> 
>   https://github.com/amdese/linux/commits/snp-certs-v7
> 
> and is based on top of kvm/next (0499add8efd7)
> 
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/2] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
      https://github.com/kvm-x86/linux/commit/fa9893fadbc2
[2/2] KVM: SEV: Add KVM_SEV_SNP_ENABLE_REQ_CERTS command
      https://github.com/kvm-x86/linux/commit/20c3c4108d58

--
https://github.com/kvm-x86/linux/tree/next
