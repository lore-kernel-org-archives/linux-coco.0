Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737024E4A8
	for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770995371; cv=none; b=GJ5qJAuQ7o97O75AYmIimy2UYTvxhXPs2JasM/s3tjGGT/b3hnPN044hyVYrrmYiOUcr6QNVrH7a6jUUbrdm6R20ATovpnSt2jR4fOjC6purrf2gY+8P+UU0b8SH68wgso63vmpzXN+yRoQjxP53AGXX2AqHLGRQJsupQbxeZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770995371; c=relaxed/simple;
	bh=leQAZ/VqItxILR/20qgaUrb5R3I3Mtb4M7v8QRSUzh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oMavTzKSaWJXeNWMuSnAKYha75Mvs+JUeC4ULCaVH3Nqv35syNHNqkkV2n67ccCS46y+2CnlMgdC341OZnO5hPEy8TbEjPwVmpMtoeXkMgvwJFXjcjAq/4gKg11ch0LGu4xjZrDkaGt9x1xrrtIh0nTwzpgBpv6KwDl4NA97nIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p0F3Wqlp; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0F3Wqlp"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a944e6336eso44687695ad.0
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 07:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770995370; x=1771600170; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DmPok8TVljD6OBh3x850TFLE5gpc1T2JrYmL8CImN54=;
        b=p0F3WqlpxEexZ1M/URmsNpV61djLr6rtYB1k/LTyuZyZJelJfP8XQevu9vDIQG9EZ2
         kj2O418PlaUtC3VMolzfpgbX22/zvbhYk9I8bln9OyZMNIuA6+I5gacciQznd77QT6pJ
         tm8EWsqG//a2OgYprok4DExn26VmKyQqq9mMmEP1Ut8hRqQ3P8ykbuTKlVpapPs0GfbN
         6487bMm4vB7XqNTrN0WR6qVtQA3YilSYzec35mcuQCoLvHIw3urKb/WsCGPIIqVYFoHi
         otNaV/iQlxIa66CDGoUAB/3Ax9idSaGBcbNskYt0lkzxImvpZaD7DHBTYpzN+Gz8xCmx
         Wjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770995370; x=1771600170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmPok8TVljD6OBh3x850TFLE5gpc1T2JrYmL8CImN54=;
        b=OJzd4GlkYtc+VLMgwV03oRp/4rf6KFTC+N76b5QaSj7AbJeOmrHQs0FwQrs1QzZ1HW
         PiJP9qA/Uo14hLPURSTwbvmz/6rvVvctRT5JN6H1siU+1uM696jAgY8P8P7+KBjlKtY+
         ZMXfM4Bm/26MfKvJwFdpuwYF4CJCeUrOQBOlsfBeFStq2bMuZFl+rtO765V+aBaJWVgA
         UAHLRVUajQHFFKYXVQ+11PTtz0fV4xlB2SJIgMHSizT6TD0wzFQ6ah3Jj8CregVtK385
         Ycwu5ek1UlOE5MvbPNXn9pIJKpkLviw12Ve3aqXK/sa6QB3rtkpfntFnUVm03pQ+pjsb
         gh8w==
X-Forwarded-Encrypted: i=1; AJvYcCVx/QWGVWUZbUqjtdYGa/+oa9YEbubZKWamaylcAaPvZAsabdrr962YJOpKFomRRI+vRNGNwjCT5PdU@lists.linux.dev
X-Gm-Message-State: AOJu0YzkIAb1/x0/WDAwCXJM2cDckohJeeo4Jj7+fGpu0wczT6ZiPF3u
	mc7WGEsGjfAodyrgTUu2+HnUTNWthU4CCg2df5XEUOFnmvmuZXoaU20Y97cQKdTlfqvFEbTzJk9
	vhP6slw==
X-Received: from pldb1.prod.google.com ([2002:a17:902:ed01:b0:2aa:d80d:395d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e787:b0:2aa:d11d:5c36
 with SMTP id d9443c01a7336-2ab50598a38mr23517555ad.30.1770995369706; Fri, 13
 Feb 2026 07:09:29 -0800 (PST)
Date: Fri, 13 Feb 2026 07:09:27 -0800
In-Reply-To: <aYxBCINUG80GYfus@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-45-seanjc@google.com>
 <aXt_L6QKB9CSTZcW@google.com> <aYxBCINUG80GYfus@yzhao56-desk.sh.intel.com>
Message-ID: <aY8-pxmoYSg5oloB@google.com>
Subject: Re: [RFC PATCH v5 44/45] KVM: x86/mmu: Add support for splitting
 S-EPT hugepages on conversion
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 11, 2026, Yan Zhao wrote:
> However, I have a question about kvm_tdp_mmu_try_split_huge_pages(), which is
> called by dirty page tracking related functions. I'm not sure if we might want
> to invoke them from a non-vCPU thread for mirror roots in the future. If that's
> the case, would they need some way to acquire this lock?

More than likely, yes.  But that's a far future problem, at least as far as
upstream is concerned.  I.e. I don't want to plan _that_ far ahead in terms of
writing code to avoid churn.
