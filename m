Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1A2264BA
	for <linux-coco@lists.linux.dev>; Mon, 10 Nov 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789141; cv=none; b=OFYBN/yVlxlH8jWG+6K4/8Vv9YQ1cB8Zgqi5dj013ENPj6m9iHjbAQR7x0eMF51D1KS9lhJyqhvrZ1nfxk7JZR8nn33ofZ0yLDvopiDM0hM6loZ19i5TEX8bfx/UGHxeXCzxvgqHJbp5QgkOkVE/7EJO65oerrDUxruhI2DfhYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789141; c=relaxed/simple;
	bh=cDyMaHDdkuq+asAIgegu+SPgoFRi3jHo3jco+i8TKbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nJVb9bh9iOHqU05Rg+wqDsVX04CN7zmKFuP1jvvXhKCRq89fdbhsSTK1QhLPyK8TW5u2dZqHQXoQccWv03hNvf4saVwLzGqnVyF/kW1xpfyxDegSAdWZquVIlB3/x7uApi/CCqryQoO/PHmXjBb3RXamcDEmXmLF06Grkaf8rZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJBSNKqM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJBSNKqM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3436d81a532so5179877a91.3
        for <linux-coco@lists.linux.dev>; Mon, 10 Nov 2025 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762789140; x=1763393940; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=laNhRLQX0XMVmOMwAG0d7wv5H+B5etUz5b1epi6/2Eg=;
        b=AJBSNKqMRcecmx/CqB6ExfSRuvlsoyUp+Qaw6iTWGkuYLo1hecwwD3BCu2C1xB8hCm
         gtkUKBCt31bp8uIDfs4jGeCQxBbKpJA1EglR2ckubuxtYvDByZXoCup1xVDRRDx0UPao
         J15bj1DbLFHRj1F7d3toRN/TpWXIlcw46GbkM3e5nWwnFCvZMqiceaeqOkAMkBZCNjuz
         Z9dsco7rbuxEiiRCJY8KxUGllH8LnZNfkqe03oyddHSiN15/Dj/Ex0GKj1/vvx6HWXxe
         8T26+l8CnI7Gm0fcUUF1TPt2XDQKoV9aLYtc/5vCQi4h+yhP6WbTUnEgQzC8FRzSp4eZ
         juEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789140; x=1763393940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laNhRLQX0XMVmOMwAG0d7wv5H+B5etUz5b1epi6/2Eg=;
        b=S/VV13ChD5HmzTSiYl1RrFzTOSU4zR/BhaFmXYJu3Si6cWiu+HeyKF1EHl9p5teN+s
         CPbwbhO2WIuKVNMFTC05tiNx9wTzMr+UJnOCjQE197TX7IxvxJVd85jVMvuyEkP9RyVT
         q+jSrscC+8l5wmZ81p+LIxHqTZkfo3ZjrD+TcPCvNiIOusmJpl2EBoaVXDP1nIlChmj4
         S3e1sXapS95OKhZrgY90qTfqphWj6j8cisX/k/Ey73Kv62/upyUbDhAPqeBT1HHIkkjb
         rTgbRvq6y4Pj8/+BiK3B7iBg34WMSBEFjsvz7MbD/TmtKsCTQpb7AexUoey0d2sTlX2/
         EnKg==
X-Forwarded-Encrypted: i=1; AJvYcCX7USQPkGYlBEcx1eYTj/BxRtw/gUMRck9gEvBPQWXA5CNPYDBzg3JvHwq7UxfrpSQMDoXbm86oq4vy@lists.linux.dev
X-Gm-Message-State: AOJu0YwPD2FCIULC4o4wLEQtZfeyRLNU7doWG1EwXD9AznC4UyNQw8Kd
	HEinlBNT5RsgpxcxQCI3H+ruAc/50dkzZjCfnMlmbyUGvyrXFgjf0LBDIZ6ZAGSn26wkT7eMutc
	ivk6fSg==
X-Google-Smtp-Source: AGHT+IHZTL6lBepPCG1wa5BSSf8eoaJ1ttmPlXua2WSmSSk5CeBLMKSmijCYjH2CcNBTA0SMfZe8CXJqtak=
X-Received: from pjtv19.prod.google.com ([2002:a17:90a:c913:b0:33e:3612:2208])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388e:b0:343:6c71:6d31
 with SMTP id 98e67ed59e1d1-3436cb29ad3mr11615416a91.11.1762789139688; Mon, 10
 Nov 2025 07:38:59 -0800 (PST)
Date: Mon, 10 Nov 2025 07:37:21 -0800
In-Reply-To: <20251030191528.3380553-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030191528.3380553-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <176278796784.917175.10578129282144167896.b4-ty@google.com>
Subject: Re: [PATCH v5 0/4] KVM: x86: User-return MSR fix+cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 30 Oct 2025 12:15:24 -0700, Sean Christopherson wrote:
> Fix a bug in TDX where KVM will incorrectly update the current user-return
> MSR values when the TDX-Module doesn't actually clobber the relevant MSRs,
> and then cleanup and harden the user-return MSR code, e.g. against forced
> reboots.
> 
> v5:
>  - Set TDX MSRs to their expected post-run value during
>    tdx_prepare_switch_to_guest() instead of trying to predict what value
>    is in hardware after the SEAMCALL. [Yan]
>  - Free user_return_msrs at kvm_x86_vendor_exit(), not kvm_x86_exit(). [Chao]
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/4] KVM: TDX: Explicitly set user-return MSRs that *may* be clobbered by the TDX-Module
      https://github.com/kvm-x86/linux/commit/c0711f8c610e
[2/4] KVM: x86: WARN if user-return MSR notifier is registered on exit
      https://github.com/kvm-x86/linux/commit/b371174d2fa6
[3/4] KVM: x86: Leave user-return notifier registered on reboot/shutdown
      https://github.com/kvm-x86/linux/commit/2baa33a8ddd6
[4/4] KVM: x86: Don't disable IRQs when unregistering user-return notifier
      https://github.com/kvm-x86/linux/commit/995d504100cf

--
https://github.com/kvm-x86/linux/tree/next
