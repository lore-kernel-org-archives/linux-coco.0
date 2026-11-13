Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578003;
	b=xKv52H2o0AQBJnSS1l+jKFKUFxbcceXmymXk6zvdDUz2yPOhvzR8+Hz2I8wAMFu5BWNG
	 4QRYlYPjNevetCpMOrCrr+8K+o/fXlbqHAd1kZ7Srua7oRP6OFw2HkBdPvIBlqQ9kBJzu
	 +W96fqgg47pwq5Wv3OjKxoaBQaJDi+1HYUR0RoLQwy8bqmRwKNelW2NOiilpxCb0uhiYI
	 AontO5s2zNzrw26fLurUht7pZmJA+K3LRkE4lFW9qhfRwEE8v96E5QjaBVKzuH3roohGN
	 it8d5wIrlKS6iud46w8rusNYt8Ku3Ns/qr3UQEm0uQeYAK9ZNZNd3s52OmZp+psmoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dlsL3F8sYJVmEsiFaoMpY1LBlwOoTrnSEiIx7tFA8jw=;
	b=x46Ex3vm9JKZXEl5txa0EebW/sfuGUU/L4wtiS4l3eesLzA0mh4OztfWgp/jnykH8xUv
	 XTPXm0OfCCDemYNePNEJ7qmFAOZYcf5ny2zZWf041X36SpkiNsqd0ipbx619+fupEwSkJ
	 PR02wqUD1JdxvRuTT9mvPBJa48q9BQgoJD9/+lBdBUfSndCFLW5eS4DKxVJJ8QzNCN1aA
	 He0qRdOFaWa+AYx6GL8jEbxol/tpyb1aSZbu5GNb5uzajDp6NZEOwwbW4oEfQKeLFIuJT
	 8uRnqiwKY3H+hD9RPOSMKoBI0J3cUZR/mHuFRqI8uOgs+WLeI5EdTQ1qD12GX63W2dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KuK7tTtR;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4112B6074113
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 13:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4112B6074113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KuK7tTtR
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so1464111b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 05:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794578003; x=1795182803; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlsL3F8sYJVmEsiFaoMpY1LBlwOoTrnSEiIx7tFA8jw=;
        b=KuK7tTtRjSxXHdLTnFYQfoiePRcpI0XJZ7gdeBzdIQPe8unynxROyjneRxyBj2XcWE
         rxL4tCZkMT76DldNAstnV3TmP1dVG87N7kv0o1Jr9+A66GKxq6pW2Aaeknjb3eT4N4WW
         Rt8P5k+GnlhfDDF26siaWkvJ+D6QjwnPceOYnD8/01LyUWYdLJqykGRnK+wSk014BN1T
         n+j4EythNtGzQ2GNTu2UU7H8XAOavjfG5ArXrB9kjsU26/jleRMLUzuJogQeNHK5LUl5
         pfV/CRYx0ONRuGjy54pmUbQBOhhZkYVhOiqjmwPxHb/ienAXDY4gYqaa7nKRAnDISkkf
         TvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578003; x=1795182803;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlsL3F8sYJVmEsiFaoMpY1LBlwOoTrnSEiIx7tFA8jw=;
        b=Xp9q2Dtg7oZglAg+igp8WSaZizLxsF8KKz8nNaBWh//K7Lb8QoSjOtjVsf+oCbrCDN
         bRx+sungB2EJOl5l+C+DI6GKKXmNz5+OYyIzRPL9uYvgPlrdHAjtXVkz2GjkViw8FPka
         A9oP9+/V6QSpVn/uevZOhX8vSCxAuqWDpS4y8iUv3paUIlWUZSyQbn19WsieN5j4GWBh
         e2bRpxYeS2yAAhITLHnVI20+mAP5sB3BtuM/wzwVHuV7lQwpPFHTu5g5EbNw48yFQNhl
         0Gbkrss94qDJioV4DMhhzaX+L1JfxN6xDKko2Wm0hExbRgFsPgzyV7smoy3YmEl4FbJj
         7LSg==
X-Forwarded-Encrypted: i=1; AL+hErGx5pjHrpAD5SnIxb6N+8M/wI7DKacxmqD2VncLowuraXgmSGu8bB+JzqHr3wB5tU/fsv3perXa0QT0@lists.linux.dev
X-Gm-Message-State: APuU4Z81Chuz5N6mQnYVuaezyHLt7GKyrufmvLenqGrPwDXBG7VDXUr3
	wvwQa2nP6PkeKwHepQflwaw2ehEIFO5bY5BY7+wgwJPa+v3BKVLCHtZkkzaQecltmeXUp1sM+47
	+AD4USA==
X-Received: from pfew6-n2.prod.google.com ([2002:a05:6a00:c1c6:20b0:8b6:29f9:ce4c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88cd:0:b0:8bd:281a:5cb0
 with SMTP id d2e1a72fcca58-8beb3b3ccd9mr2811215b3a.6.1794578002302; Fri, 13
 Nov 2026 05:53:22 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:41 -0800
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441778800.76592.3104502166440669144.b4-ty@b4>
Subject: Re: [PATCH v2 0/3] x86/cpuid: KVM: TDX CPUID fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 Oct 2026 14:01:31 -0700, Sean Christopherson wrote:
> Boris or Dave, can you grab patch 1 for 7.4, ideally sooner than later?  That
> would avoid having to carry a stable topic branch for a trivial change.
> 
> Annotate CPUID entries that have a significant index when reporting TDX
> capabilities to userspace, and enforce that userspace honors significant
> indices to avoid creating a misconfiguring between KVM and the TDX Module,
> which in the worst case scenario could lead to host state getting clobbered.
> 
> [...]

Applied 2 and 3 to kvm-x86 vmx.  Thanks Boris for fast-tracking the CPUID change!

[1/3] x86/cpuid: Mark CPUID function 0x23 as being indexed
      [already upstream as 108775fa28fe04a16f19a828a779689f3d0ea9f0]
[2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate when filling CPUID entries
      https://github.com/kvm-x86/linux/commit/bfce14e80e89
[3/3] KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID functions don't match
      https://github.com/kvm-x86/linux/commit/c576a80cfc4e

--
https://github.com/kvm-x86/linux/tree/next
