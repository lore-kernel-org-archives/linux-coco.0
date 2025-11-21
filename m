Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE172FFFA5
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 18:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763751376; cv=none; b=NHWhkREECe/uKfWAaO+9CyoSKc6oJNAbJegQVhEUDEvu2GDqwVpvAnO6T+cc2RcIyu7mruKhOv21KjwSLcZS6abNsI1HrKa+tNMDZHbp06dG9TENSYB7Dp26lxL/iiyJItwovwEhpSDD7NEDVLFh0jr2ecqz+l9scK8CZAGZrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763751376; c=relaxed/simple;
	bh=pA6HhH8cYu8tFmUOKlzpU3Wp08scGDLJ7KsfyRnftss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nk/FBj24pQzMN/oz5/EWXh+Wp7UeDAjmMPGjdxX4AKj+DKPmtiNhNGGfJ83RF3Ds99zEejenGXo/11D5aVclIvkH4l9DPewMQ6/8FLOgy/MYHMWf18XCs48lX/dY7xOXV5iZVlIfJ22DvmQj43xQIQQvtdAGv1wKOO+KGJCjopA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N4TGar6u; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N4TGar6u"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-29b760316a8so4167635ad.2
        for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 10:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763751374; x=1764356174; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dyfHUqL6df9F6XiTb90JYkfND1n7NtpKe8YZliaM9OQ=;
        b=N4TGar6uW3D2lVJHigP3GEKcMOr92qtzQPpt9bgsKy0gVb5un9ODMiqCUsxH+oklAc
         cNttk7wy9yoIj1cFo+UaF+nuosWHoA+hEBHkz9V/syPYj0JBMRn8cupb5+8fkCqTvasu
         0vWCzFSLsRBytlIV6dhh3RlS9H1uXBLoEzB6mDu+AKtBfKLK22XRy70q5VlB0OidzKKZ
         viA6x1h/X59qh0hsIbDMDnvvSpV3OO5arIwDv2bI6QPckELVZvG2xA8GjfC3qR9ZPspc
         PSJ+8UQETij++MBwnWMsl9uHZGQoxBGISg/qvIHDQWlPNJd3ewFa+O/CFrXlV0FOpOKz
         ClOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763751374; x=1764356174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dyfHUqL6df9F6XiTb90JYkfND1n7NtpKe8YZliaM9OQ=;
        b=duvSr/Qj32JenFyOF85yYF0LihwNNJlRna95L4Veuw9zUnBRGylhTN7z6KzOOxoVf4
         hUa3LwYcLzoYwVhXcA0iz3MO7+MFXpz5bL6Gj6X/usrAi3hDwD+vyMIcWROeo0OPSwDK
         lD7TZyG3kuuWHO+xjGzBHpXko0PwuKvLE3NhbtDPdDYcSWCxuPsT9mwJXkKEf4kwsLqU
         oTWVjDo31SVIQI2jvLtePS/1ngZjNmBLjOwsMztxF77rjih2dy8GdpqNTrFZ06Ld9U4A
         59n+7iaIKFNgXcTb1wntK6xCpuxTkMl5Lz6lYjJmjhfMhp1ilqQL6pPJDsDO6KEydGVW
         wWaw==
X-Forwarded-Encrypted: i=1; AJvYcCVipKCHDraAxBzl7wFk9SWqNfbudLMKvpYvGYcIk2WGh6ypBdHPfl8i18biNfkQjcyw8qPEgjUZD6Xm@lists.linux.dev
X-Gm-Message-State: AOJu0YzyRGFLRml8+QYHFsHoMMnINsgNxnmdu8h1a5Pfc+EsSiTl8S2a
	o/eIO3CwroxRjktCkPnnG2qOikQpEwd4Q4Ds6u8I70C16y0LD/6fskG7Tm3Rm5HMmdeg16P4SQr
	VMPH7qQ==
X-Google-Smtp-Source: AGHT+IGGb1aHI5E6UaxYSqn4n/1r9BCGdlieziJtcx6wMic5y2PJaDDWne0NG5Ox3KhGZrA49vtPf+i99x4=
X-Received: from plhy6.prod.google.com ([2002:a17:902:d646:b0:298:1181:af51])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:46c8:b0:24c:965a:f94d
 with SMTP id d9443c01a7336-29b6c699252mr39885405ad.46.1763751374581; Fri, 21
 Nov 2025 10:56:14 -0800 (PST)
Date: Fri, 21 Nov 2025 10:55:31 -0800
In-Reply-To: <20251118222328.2265758-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251118222328.2265758-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <176375129628.290245.2248166569099413567.b4-ty@google.com>
Subject: Re: [PATCH v2 0/4] KVM: x86: Cleanup #MC and XCR0/XSS/PKRU handling
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Jon Kohler <jon@nutanix.com>, Tony Lindgren <tony.lindgren@linux.intel.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 18 Nov 2025 14:23:24 -0800, Sean Christopherson wrote:
> Optimize XCR0/XSS loads that are currently done on every VM-Enter and VM-Exit,
> by handling them outside of KVM's fastpath inner loop.
> 
> Context switching at entry/exit is unnecessary behavior inherited from a
> hack-a-fix that papered over an egregious #MC handling bug where the kernel #MC
> handler would call schedule() from atomic contexts.  The resulting #GP due to
> trying to swap FPU state with a guest XCR0/XSS was "fixed" by loading the host
> values before handling #MCs from the guest.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/4] KVM: SVM: Handle #MCs in guest outside of fastpath
      https://github.com/kvm-x86/linux/commit/ebd1a3365500
[2/4] KVM: VMX: Handle #MCs on VM-Enter/TD-Enter outside of the fastpath
      https://github.com/kvm-x86/linux/commit/63669bd1d50f
[3/4] KVM: x86: Load guest/host XCR0 and XSS outside of the fastpath run loop
      https://github.com/kvm-x86/linux/commit/75c69c82f211
[4/4] KVM: x86: Load guest/host PKRU outside of the fastpath run loop
      https://github.com/kvm-x86/linux/commit/7649412af3ea

--
https://github.com/kvm-x86/linux/tree/next
