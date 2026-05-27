Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF704657CE
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 18:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905960; cv=none; b=WG6dKGVcYLMHtlGKIITJF4p2YL4Nmv0qJmw59Aiw8VZx6A13YByhsnIR+frxFLiq7YUhe8wlFDdR5kqIdRK9Vn34Tply2cFPj9iR5RSaQTlKNzGOIGT+XE5GStNUK4XN19QEqlnUUrVKEBav/dUBMMosrM/MLfaZ5Jdxg95Sn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905960; c=relaxed/simple;
	bh=Z1Zx94X0cWuLLDvuaWo3EIgzuHMb287gu3LLySsTcqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rkTQXP7ua3XAKjg1vcsSHzzjjEIUlBlX/lK2jyIbq6jkjN9B+E+NhdmDK2EraTwD3Jmog7YsIgcwK9W6cPmYGdWgaD+IMvPgkQkL/MDm/GAWFoR6PnK2M/vCbS2km4SrfXQhg26jYlfr6tS3nLGt30q2qU3NqHvsUIm3P8Fyg4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cJ573j1S; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cJ573j1S"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba6fe41283so128751725ad.1
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905958; x=1780510758; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FDMNy7yFqqnYdLo7TleGm8a+2NMQswa9bOxZdbuYmc=;
        b=cJ573j1STTXeF0Fl5XpHjUALC570NwHhF5eFRT+F416jODPfneOrZ7UvJ2sbGH48cF
         CEj4sBKK9uEvvQuxSzazMTq/B20eQ8evaNqXySI3V+Xyn/4vRCs8Im5sNaP7yQ59si/3
         7jdJ5GnzmdXj5jhc9YTiQA0caDUcFEdVPVEPjV2zvaRKzts2z+HsLi7rmhWpEOOkKPz+
         Lrey31gYOqMESREPZzsI808WygfP3kg/RRQa0gJIUMoRLSrSMtR3l4ka42DF+lIN9j1C
         AlU5UoQKV614E894h+/QwXbJ8yNYafmwX2l9pRhvpU9KLBntn+jxEmTBLmr76EqegWZx
         34xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905958; x=1780510758;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FDMNy7yFqqnYdLo7TleGm8a+2NMQswa9bOxZdbuYmc=;
        b=e84nQ9GnU+om+s6AlhVoWcoj7uEeWr/lueAn7bxS+qpJ2FORVuhVVFczLVXuDP9PkW
         QK/3hVr0x4j7GQsvWRDgvfL74zM8VkKXXVZzoYwJARmj1OJSsScIA6mKbSOrjAfvl/wa
         qDn6AMU1bGJvvJMocSbKRdGm+XcjZblR8W9nRRmF9WZcXcPqH5qvOkemMjzGjTOS9nk5
         18SmbDOGAw37xdFF/Bc55zRfOitFAnDt61LwEPuQgX6yik8gw06+mA+X/k9G/+qcmaGy
         6ujmWO44nMA5Bo0M8p4qZnT3chOpSDP9FiV/uT2+NDgVNExa6FVP1RSySuuioE6P++IZ
         1QSg==
X-Forwarded-Encrypted: i=1; AFNElJ869U+ydP8VRl75f1S5Y/vs0FcmQKyWeU76D0N6QKt0bx1+wUCWct1Qmk4PQAaW6nM03l/59YiyjaTm@lists.linux.dev
X-Gm-Message-State: AOJu0YxGsIPcuqaA+3sDcKCeV/vQpemCFNyXfHD0G0NtTTsxZ7Mm78uw
	uFi919glzAkYF3Sk3Kk3W70PZfIbT6exkh5lKuirdzqpd1vao5mtZ7OoLgzxCvokDEQpnD3G/gv
	/7kfeHQ==
X-Received: from plhi4.prod.google.com ([2002:a17:903:2ec4:b0:2ae:abe9:b38b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc85:b0:2bc:e2ed:fd03
 with SMTP id d9443c01a7336-2beb06a041emr262464465ad.39.1779905957936; Wed, 27
 May 2026 11:19:17 -0700 (PDT)
Date: Wed, 27 May 2026 11:19:13 -0700
In-Reply-To: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <177990575884.4125337.10193162766753947326.b4-ty@google.com>
Subject: Re: [PATCH v2 0/5] guest_memfd fixes for bind and populate
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 22 May 2026 15:46:05 -0700, Ackerley Tng wrote:
> This series is a group of fixes for the bind and populate flows for
> guest_memfd, and fixes some issues reported by Sashiko after reviewing the
> guest_memfd in-place conversions series [1] and another fixup series Sean
> posted [3].
> 
> Changes in v2:
> 
> [...]

Applied 1, 4, and 5 to kvm-x86 sev, with massaged shortlogs+changelogs.

[1/5] KVM: SEV: Pin source page for write when adding CPUID data for SNP guest
      https://github.com/kvm-x86/linux/commit/f13e90059908
[2/5] KVM: guest_memfd: Fix possible signed integer overflow
      [SKIP]
[3/5] KVM: guest_memfd: Handle errors from xa_store_range() when binding
      [SKIP]
[4/5] KVM: SEV: Unmap local kmaps in LIFO order, per highmem requirements
      https://github.com/kvm-x86/linux/commit/138f5f9cbe37
[5/5] KVM: SEV: Mark source page dirty when writing back CPUID data on failure
      https://github.com/kvm-x86/linux/commit/97cd21d57e9b

--
https://github.com/kvm-x86/linux/tree/next
