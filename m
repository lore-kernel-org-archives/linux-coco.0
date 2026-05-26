Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6245C3A4F47
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779824248; cv=none; b=OmPposRAParoyEx3FwA8tMfUsMhyPRr9i8xCEYlIfTk7q62AtmKAvPot3qME7xdGArIXTvFWJHJnHBInF5+iJKA3vAkkpk7z2RylW/YpL/rqw1pkxAtQ/bDZe0btMouzrOMOYyKP5afsV99EFvALi3pUwo5JP26ygHoOXCdEzsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779824248; c=relaxed/simple;
	bh=iUFkuxnHj+cpqwwryHKC3vge47qQtUDj15ZV0LW+iBw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ip1MBLMJj44zLeBcbfCq/E7vwhqV6VX6rL1rCYs4PuaY8oPFc8FkhKsUiv/6aRqoaMTI4pd8PjmH8D5Ei77HglXDGBH7A+ruK56snXUQb8ck1UdeASahA/0Mvr5vw0d9Sjh4OLWaSwkJK1faJCdeVJUvmXktEn1DJ/quROXKRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGJ6oMDj; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGJ6oMDj"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so10874240b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 12:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779824247; x=1780429047; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2LUH2rnlVmx0tYjHhRhFb1FVJJlzW2bbDoMOmlKuPc=;
        b=lGJ6oMDjDkHmxmgIwuWs7dK2R8O6DF6VYSJw6fdffy+WIpdnANpWXqq1kGQLdNjWOG
         bs5evT4V+r9OPrd+K5PjymI8ywRGf+7ducxHWmI6ijXVLXkLZErzcFwGBQZK+T/VANax
         4QMah1onNxAIrAD/PKpS8hfFLwWsNytqtzNSVMw67OF91Q5xP6cskYTVqVEJp3YAt5kr
         40xkSYlrla6F8XG2z7NB7ZDypk6+10aNslk7CKIQVytVSasRE0MCK12HsyMCMngkoa0j
         lZQ+5IpXHMyOsawzZ3UFMn7u0+yzB0eSRGgMC+wJO4jEKYcjz65b/qGJXtQeH2GXTf0c
         90zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824247; x=1780429047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2LUH2rnlVmx0tYjHhRhFb1FVJJlzW2bbDoMOmlKuPc=;
        b=B2GJGyzp9Qg5FBshMx2pYqND9NT2uTIImPNaPOqaMJwghPcIosmu2SpiW7GsEhYp7f
         pgHFozJx42rJfqAixAJxZjTqGzz1q6ntFJsBoOiU3x1/3HsHJYKxXIUCfPRHCBKYxcCg
         V9KOypyBCjYTMt7zp55GKVxFOMSMtimrYLJC3jI6LAodOzaBEzudVmA6FXgEUQDcsQX1
         ujVi4IwJ8iKYsjuuqF41RGh9+FTSvSLJzjuRdBaI6qXweMHY3mgZw5TT5N5fxnkE+wBE
         WRUH85tbJVerdkLg3XyFdTCffBdE6iStiU4CE/oWRAB//IDw8/fK/nsN1UK3NWSk1vQO
         Zl1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+QIZNn0Kt+pAZ2N4CQyBClXpMz2qP3wTDr42iWiIB5oGSAL9zVujxHnXaa01wf7IJ/WXzQbzrgyRJF@lists.linux.dev
X-Gm-Message-State: AOJu0YwD1z/xQEOCqTvSwAS7WBa0NEmelnOXp2j0ho7iMfAEdi0rE4TM
	0hH069mRA0Zikk2ljsWLB27lu+skf0CedW8Vdjt5pqrFdA+UbUotswQACwcfBUF5wuV5xwCnPpf
	+WCquEA==
X-Received: from pfbgt8.prod.google.com ([2002:a05:6a00:4e08:b0:837:aa2e:b191])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:10c3:b0:835:3de0:fad5
 with SMTP id d2e1a72fcca58-841611f213bmr14436204b3a.25.1779824246309; Tue, 26
 May 2026 12:37:26 -0700 (PDT)
Date: Tue, 26 May 2026 12:37:25 -0700
In-Reply-To: <20260430014852.24183-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260430014852.24183-1-yan.y.zhao@intel.com>
Message-ID: <ahX2dcHAQgwuiJBC@google.com>
Subject: Re: [PATCH v2 0/4] struct page to PFN conversion for TDX guest
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: dave.hansen@linux.intel.com, pbonzini@redhat.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, kas@kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	kai.huang@intel.com, rick.p.edgecombe@intel.com, yilun.xu@linux.intel.com, 
	vannapurve@google.com, ackerleytng@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, isaku.yamahata@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 30, 2026, Yan Zhao wrote:
> Hi
> 
> This is v2 of the struct page to PFN conversion series, which converts TDX
> guest private memory mapping/unmapping APIs from taking struct page to
> taking PFN as input.
> 
> v2 is based on v7.1.0-rc1 + Sean's 4 cleanup patches (see details in
> section "Base" below). The purpose is to get Dave's Ack, so Sean can take
> it from the KVM x86 tree. The full stack of v2 is available at [14].

Dave, any concerns?

I'd like to get these into the KVM x86 tree sooner than later, so that we at
least have a fighting chance of landing the S-EPT cleanup (prep work for D-PAMT)
in 7.2.
