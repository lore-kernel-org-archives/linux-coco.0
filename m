Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44843101B0
	for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057375; cv=none; b=loZkQQiM5nG2tV1S2IRj4OS2kItRZcO0uis5TVU3jlQiC0OJPf7ROPQ0MuDpHkBfcf/OtvSUc6WTJyvc1G6879x+dRc1Psw4SGMgYHDVrZbm01Q6KQUNJ66tQ+Dzf7BLrBsgjAxjTdv43NVkCnx8urYbxzMlwid9Mu1FxI+Qxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057375; c=relaxed/simple;
	bh=5v0pjtg16nOYoh0LqjejD+BH5n9SM/7iCdtqM2SxC9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CIfg13zo2969Q8GlNQgzOzmhH89MlZLy/bpLZhhGzRITSgbDMGq88TZZQzPJrtd1hprE9gGh7v6Dv2YK49q8z23eGhQ8HF6BESrQbscjDAlJ/aaXqEzBfxRl8mcDXEjbAICFgAQUTBMfRurzNxglzRGsTIBSAPnsuf7/Qg4S5gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sGwYKfQk; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sGwYKfQk"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8482b95574dso5878565b3a.1
        for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784057373; x=1784662173; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaWAefms5g2sZE1zJRpUsheJBiizyXeD+J/SLEPa9K8=;
        b=sGwYKfQkBqKhQ/rtoKVYwFE3iG1eRXum4Zh7rVxuS2V2tW9FlNAjS4f40mu+9UuwYP
         xQiatgBgpXYrCPJ0xb4lD/E8c+5BMkMJ16K6n16VPfiHxL3zXnoabn2h0hhAlStEmXYP
         6TOJ3hZqFqZ+s+I9VESI0ByV0Yk2lrw2+/msxCPEF5TcektAoPq1W2ef6GqT4TR9qIVI
         EuwZwS0i1xsYNUH9adf6NATkz35cdAjq4KHScO6umtMlGqxkY2Cd/eITvn410CvWrsiE
         odv57hD+Y7KXwSxGTMWpRCNaKfqVyihhZ74baH54ra+E8c01iLcM+gluIQe9pEG/NlUq
         k0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057373; x=1784662173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaWAefms5g2sZE1zJRpUsheJBiizyXeD+J/SLEPa9K8=;
        b=BIOLDn/Ph8ABCZVtd1IVm0dd6NG5zgDE8PgPS+dDiVHTr7/HfrSD7xf+j4LZKBWKn7
         F+dFRKWFcUz4cy0nOdY20THRZ8DBeZuJmU8o/VgKtB6/7kAXuXbS9nrn3T/be+deEZ2a
         cGE0u//KV9uf1ekfBbp+fiuObdaPlbiypt4kTsjvc7MExG+eNWO/lbH8kGADQ8LrUpuU
         SXJWX61h1s5FF2rmhudGV6DlFtDVP6VBw4WyaPiktHNBkJphC4ksPfAAiVQY5A4AuCkx
         +Dvw7lIWu5jMuNUNS5mbsX/UV2sYw8dbH287BC01VmJxw0o0JfCKA6VSbNodWgCA8Bi4
         jv+w==
X-Forwarded-Encrypted: i=1; AHgh+RqWAuMsKCFxo/9gipO1WCzJKfHb0tOoMdzojlXC7BxAQY/Ip9uYTA7XQE9WJ/F3ULn+FR+HIF1prZAn@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8/Fl7oLqRhBHit29Y4LUkGg2yqvvFquMU1hCYWJ1QmXsFCJnG
	I36dkW4dXR7BRodTNy+hohttYC59fuprNqseSICx69Aun6LpYxG7s8kdw8Ktm72XWHxyBKiwywv
	IuV++RA==
X-Received: from pfee10.prod.google.com ([2002:a05:6a00:bc8a:b0:847:8fa5:76bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14cd:b0:847:83bd:6671
 with SMTP id d2e1a72fcca58-84889667647mr13185570b3a.19.1784057372703; Tue, 14
 Jul 2026 12:29:32 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:41:25 -0700
In-Reply-To: <20260630213711.479692-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630213711.479692-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <178405433333.3142919.4680610079893572404.b4-ty@google.com>
Subject: Re: [PATCH v2 0/2] KVM: x86: gmem populate fix and cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Joerg Roedel <joerg.roedel@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 30 Jun 2026 14:37:09 -0700, Sean Christopherson wrote:
> Fix a user-triggerable WARN due to KVM not pre-checking that userspace
> provided a source page for non-ZERO pages for SNP_LAUNCH_UPDATE, and then
> clean up the equivalent TDX code to also explicitly check the incoming
> source page *before* calling into guest_memfd, and to return -EINVAL, not
> -EOPNOTSUPP.
> 
> v2:
>  - Rewrite the SNP patch changelog.
>  - Tweak the code to avoid checking KVM_SEV_SNP_PAGE_TYPE_ZERO twice.
>  - Drop what is now effectively a sanity check in sev_gmem_post_populate(),
>    so that we don't have to duplicate the logic when in-place conversion comes
>    along.
>  - Tack on the TDX change.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/2] KVM: SEV: Explicitly disallow NULL user address for SNP_LAUNCH_UPDATE
      https://github.com/kvm-x86/linux/commit/2abe1ff20151
[2/2] KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL INIT_MEM_REGION source
      https://github.com/kvm-x86/linux/commit/eb606a243863

--
https://github.com/kvm-x86/linux/tree/next
