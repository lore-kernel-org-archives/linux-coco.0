Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F028852B
	for <linux-coco@lists.linux.dev>; Fri,  5 Dec 2025 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944201; cv=none; b=PURWFq+683L0fXWl+VN/Ijyr+HfeS2I9uJ37KzZ8M+D3xuMvdGpa/8K0FOHvBCJzfLN4x7t8scGceLQnoNAqmdoF1XEJfMR7s9mvPoMV0WfgDWN5GVDBSQJbElFG/HYZMGmlnH6DUjq4gUXoBsht7eUP1NTnjvydwoQqwwQGh5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944201; c=relaxed/simple;
	bh=PCMB+EhGQSB8Pqw3nvG4H2MT/nfPBQOMy02+eGLTOcc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XZNcpRUNjC90B+v2WD5c70N+4Q9y6AflQLdWxUaUWx8+rUyfwzXQAcJKOMqtSel9ljXnai21yVQrjKgNc5ieISNATex7K3PQG/kAy3YSonK4XzC9vcnwhh+GoKJ4RSOM4607oB9XCMUvH9pDQmgI/leJGkTXzRgS3jL9Zt0kW8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kW7XSCKp; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kW7XSCKp"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34566e62f16so2508129a91.1
        for <linux-coco@lists.linux.dev>; Fri, 05 Dec 2025 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764944197; x=1765548997; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mC1Hm50scHMH4ScGODeyyYoa2AK7zti5T9VBpoRnu2M=;
        b=kW7XSCKpDHqQ03EimFaY/eS1jtKAoT9Y8sKJgW1+7r785RSdZiKl5qYVVNfIzeuaV0
         QU0Pz2WOgzrw3/rHWkIYcOIBp2Uj4o2OBR56nbj33QBgY+DY9fQnNe2tisTtoUmLlG7z
         QhNdNEqXOQXiWco8M3VTHlLbnZAPmuLxXmDmQJ+mL7Xd0O3pgztar1aUZX1WTD4o2a7+
         W5BmmlIwYE3BZ2TlhDhnpjZKeaSIdgS4KspNzppdnXORfpBUzwdIxlpd1A/Du61ClAqx
         +7KUM1bGAcTVSvwUehnWFfO2PZMEB6xq8cOGuLv1Vaq8uDCvwDFNLJQQaw5gh4k3VWmo
         PQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764944197; x=1765548997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mC1Hm50scHMH4ScGODeyyYoa2AK7zti5T9VBpoRnu2M=;
        b=VgHjb6vvNQskGEye7FE7lCpW+m/rFnhUVmETvII0QubAxRi/ONLVYgPyxUHqJ51qpV
         FUtLmx9F74lp9ytuE3FJTvaai7SK9Y9P5NqwZeu5TvcczH3m1sfp1bnvEVl5j+YOzFAC
         oD1BXkwbblkX2XPAbaePDGxKzBZC1zO1WAIBmYvSkR7uoYWGdgbNhFBfwkOQNpVQlCpf
         Eh6ZlKC/gvkq9CabIMnBAi+wunRtrcNp2QK+KQh6NNKcuvTx5xqUfB/8RnaXlL4wOPB8
         XdRev8GyV4+MZ4ahCv2qicwEygSYVXMfZYOYfjLrth/kmxCkXVJlNItd/k+9VLmqbIht
         VCgw==
X-Forwarded-Encrypted: i=1; AJvYcCVDNyqUnz3ImbwD3Ipb9VKht4DtfKhUCGWYnMXyUDjGlbUNQ2lPcrAI/FWRRpFWLGBNbL/uE70pMdAA@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvk8byT/Mzz8riQeT0vC3qFc78RjhzgbAd2ip2my1PFphKlpb9
	BeYv3OQ1w5XAy3pp+yMZh0ep5twcwwRM+HindhHLsJFzeqzNGSxoOm2JrFQCYwYxUAEdfH+TGnI
	EeuxCWQ==
X-Google-Smtp-Source: AGHT+IHPC1TNdjrjBaT0jJG1JbHdSMGCknpgtPEMfVyST8tA7TeHUt8tTSHbGau1hACrUhIlu50Nq9tHdxY=
X-Received: from pjbbj14.prod.google.com ([2002:a17:90b:88e:b0:340:c625:b238])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:56ce:b0:32e:64ca:e84e
 with SMTP id 98e67ed59e1d1-3491260060bmr12132414a91.15.1764944197563; Fri, 05
 Dec 2025 06:16:37 -0800 (PST)
Date: Fri, 5 Dec 2025 06:16:34 -0800
In-Reply-To: <20251205074537.17072-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251205074537.17072-1-jgross@suse.com>
Message-ID: <aTLpQjsSsjQbHl3y@google.com>
Subject: Re: [PATCH 00/10] KVM: Avoid literal numbers as return values
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Dec 05, 2025, Juergen Gross wrote:
> This series is the first part of replacing the use of literal numbers
> (0 and 1) as return values with either true/false or with defines.

Sorry, but NAK to using true/false.  IMO, it's far worse than 0/1.  At least 0/1
draws from the kernel's 0/-errno approach.  With booleans, the polarity is often
hard to discern without a priori knowledge of the pattern, and even then it can
be confusing.  E.g. for me, returning "true" when .set_{c,d}r() fails is unexpected,
and results in unintuitive code like this:

                if (!kvm_dr6_valid(val))
			return true;

For isolated APIs whose values aren't intented to be propagated back up to the
.handle_exit() call site, I would much rather return 0/-EINVAL.

Do you have a sketch of what the end goal/result will look like?  IIRC, last time
anyone looked at doing this (which was a few years ago, but I don't think KVM has
changed _that_ much), we backed off because a partial conversion would leave KVM
in an unwieldy and somewhat scary state.

> This work is a prelude of getting rid of the magic value "1" for
> "return to guest". I started in x86 KVM host code doing that and soon
> stumbled over lots of other use cases of the magic "1" as return value,
> especially in MSR emulation where a comment even implied this "1" was
> due to the "return to guest" semantics.
> 
> A detailed analysis of all related code paths revealed that there was
> indeed a rather clean interface between the functions using the MSR
> emulation "1" and those using the "return to guest" "1". 

Ya, we've started chipping away at the MSR stuff.  The big challenge is avoiding
subtle ABI changes related to the fixups done by kvm_do_msr_access().
