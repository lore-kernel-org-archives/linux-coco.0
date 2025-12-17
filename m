Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A3A10FD
	for <linux-coco@lists.linux.dev>; Wed, 17 Dec 2025 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765998123; cv=none; b=f9m22Nm1x4OYZmmDpHl0cTebqVAtCxSnwM9lRd0lmQzKfB6UeAijvDyIqdCwwV73er+70YYgSjdIR2sRc2FVR9GFKE4Gekb1AWo/QyjWMVtn2a7fp8P8l8n1cCrChGicR+2k4wKatj3Y/dgx9l8JeNgkQmYzyKsmQXECh4sTvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765998123; c=relaxed/simple;
	bh=m8dUE8g1LgHdwHNkk7BZCZqvG8Sc2oxSqpY7oOcjwS8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SZAzHG0Xs86QZkRYdvAf5t+7DwIPWXLt+ON++JVjjEimk6rivNfYF9gV0m0TaSBralkQz5Q/3y7ViXXusnNAa0+v/B4EiAtr2bBGrzcDLf/3BUHmfqomT7eu03ckdgVieIHmWHCpnOU+jQR3ViOr064cTTLiU8Y40nWSM/i4+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OV3VIy0/; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OV3VIy0/"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7dd05696910so8527122b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 17 Dec 2025 11:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765998121; x=1766602921; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b196TMa7CXfRLkl43jhb5OXtBZInCMzwhdlHo087zrU=;
        b=OV3VIy0/APUej/bR8N29yKvZUJsKiXHip/11ZHjIbbyQ/kQxz0hAmo2NJUBiCQ55Kw
         +ZDgfSgOv6YszIR8JdINJTw6szkZVYG7jLLMhDBS1SAvZLg04CUFThM6GkXQLuyewc/m
         Fddrw9//Lr8CnBIqzR48IR9OSG7gRjNKshqnHIRFd1A1AIUzrWSu9hEGVVYW/FbhGuHS
         zKH1KsVOND5lH+uinShyUjvzrrAXZHYFXW88RAvOcAT63ShwzET/Zz4+0l806AVeIq0q
         47SXDwYitR51axkNN4ReQ8zkzrwS2j53Vgo4O1zG87TlNyCjNKnRMtoCQoA1rckGawvm
         T0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765998121; x=1766602921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b196TMa7CXfRLkl43jhb5OXtBZInCMzwhdlHo087zrU=;
        b=PlmB05YSl1xM5iTtLXKbB5S4gexinnnBjgWbni0xCYQaVGnmHp14JMEbKtZFZfHs/Z
         +IM7RBOhheRq+eojZHOdwXWk4FnBb7HHl/HtkWWyFOS+cyQSCwuEfsRcgEjtamAe83be
         ogw1UqTvo3hzUHnuoSfckRZfHVCRVL1/rgxuKKlxkZB3G2O7TTctYT/mry/dixal9ssN
         nCiRmxt9GsMPI0tRPAp4yBq1373emQIkSn6TzsLMjhwp0UkmkycYSU2PiVIOeRRrsKc+
         kbs1rZG2B08jsXUm+riGi7yMhLD4mUfsrinHeNd7Tq/U7n9mQkKJlUH4f6zMKGRHDXxt
         SfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYevQPgozzEgvzyEIVjgxCV8PD7xLrDaqZoa3ld8s8R2rLhpVQntuXDrlRVA52E5ISdww/HgYR9n43@lists.linux.dev
X-Gm-Message-State: AOJu0YxHnMZZCzR/u0NEaDFgtxpY8J7+G/VCJWrGXvADQAtvYZ0jdA6t
	IIdCvu9URaLbqVaR8wBEXULomXGthrhIx5lZTKBjKyEQj9vsiEop8GrU5qV1xbMKjd6WtuBTcVq
	900kXXw==
X-Google-Smtp-Source: AGHT+IGD0zDEZTKQcWsJyRh7TATbcIzYyFxP7Izy5G+weXhOkr6e/I6dVMxD5z7EImnePu9h8mI6YEz7V1I=
X-Received: from pffv13.prod.google.com ([2002:aa7:808d:0:b0:7f1:8c5b:2e3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8c11:b0:7e8:450c:61b7
 with SMTP id d2e1a72fcca58-7f671474d70mr18440345b3a.39.1765998121154; Wed, 17
 Dec 2025 11:02:01 -0800 (PST)
Date: Wed, 17 Dec 2025 11:01:59 -0800
In-Reply-To: <aUJUbcyz2DXmphtU@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-3-seanjc@google.com>
 <aTe4QyE3h8LHOAMb@intel.com> <aUJUbcyz2DXmphtU@yilunxu-OptiPlex-7050>
Message-ID: <aUL-J-MvdCrCtDp4@google.com>
Subject: Re: [PATCH v2 2/7] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Dec 17, 2025, Xu Yilun wrote:
> > >+#define x86_virt_call(fn)				\
> > >+({							\
> > >+	int __r;					\
> > >+							\
> > >+	if (IS_ENABLED(CONFIG_KVM_INTEL) &&		\
> > >+	    cpu_feature_enabled(X86_FEATURE_VMX))	\
> > >+		__r = x86_vmx_##fn();			\
> > >+	else if (IS_ENABLED(CONFIG_KVM_AMD) &&		\
> > >+		 cpu_feature_enabled(X86_FEATURE_SVM))	\
> > >+		__r = x86_svm_##fn();			\
> > >+	else						\
> > >+		__r = -EOPNOTSUPP;			\
> > >+							\
> > >+	__r;						\
> > >+})
> > >+
> > >+int x86_virt_get_cpu(int feat)
> > >+{
> > >+	int r;
> > >+
> > >+	if (!x86_virt_feature || x86_virt_feature != feat)
> > >+		return -EOPNOTSUPP;
> > >+
> > >+	if (this_cpu_inc_return(virtualization_nr_users) > 1)
> > >+		return 0;
> > 
> > Should we assert that preemption is disabled? Calling this API when preemption
> > is enabled is wrong.
> > 
> > Maybe use __this_cpu_inc_return(), which already verifies preemption status.

I always forget that the double-underscores have the checks.  

> Is it better we explicitly assert the preemption for x86_virt_get_cpu()
> rather than embed the check in __this_cpu_inc_return()? We are not just
> protecting the racing for the reference counter. We should ensure the
> "counter increase + x86_virt_call(get_cpu)" can't be preempted.

I don't have a strong preference.  Using __this_cpu_inc_return() without any
nearby preemption_{enable,disable}() calls makes it quite clears that preemption
is expected to be disabled by the caller.  But I'm also ok being explicit.
