Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A642E2EE7
	for <linux-coco@lists.linux.dev>; Wed,  9 Jul 2025 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071245; cv=none; b=QjDw403iWfjnIu0sdCjvWSZDeVrxWTWzgk3hcQhP2+Hdvh4uVwtgFqm4LZK5PmDQo+bFgMheQC0HaQJ5Q0LJh89Of12+ABngmtR46q7jLigWU3fZj4HyXa4/GLW3nkz4ltvoyXXr5J6DiGPOX8YL4iliZ7pL2RjWfWVEZLSncwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071245; c=relaxed/simple;
	bh=pvkwBrcqCz/q7TbAy/707f2NDn31fDmeAF6bySTr6Ic=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J17Ll3x2ZW2ADAUtdOqOy/PtCKCYVi8gftGXh8DZFxF+sbf3tELyx62I5dQmt/0Vn3ufbC4vB4UfNf+0VeoYYS3zeCbWn8hrNLYm2oIce2UBLBij3yD1bsZY8KT7NQNSY8XUXH9qPyuYA8xhc/DDNzKQKgY4BVMAaIH3bNkvpLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7b20BCr; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7b20BCr"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748e1e474f8so8602472b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 09 Jul 2025 07:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752071243; x=1752676043; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ny4OheUvtoLgeKPBXu3zvqh0EKHCtc/bq+iQEnC2Ww=;
        b=d7b20BCror3SCjEE0Kp0bxBd1XNZ8kyUm3z2usOw5Hi8wCsLvhCABqd0ajgvSiGs8m
         vN7yTZyuZjD+MCMUkb+Jl/WJXDeMK0AFDALTyDPXQYCKK7saf/fx8d3N9UtDcElDq4dm
         a/A8pxFlZuEQyuuaf/q04ZEmV4BqLmtatY+abwQYj3BZQeiV3RyK8z9qUPL0Z2Y43jAM
         LY66vUj3r41xuJn/dABj2bXqoRh0aHz0wrJRL0+Y6PiCajvaGVZF76s5NtLlv/nQ1Vr/
         VIlbHXDd6WPJvZyxlDDZg88OnEnMnaipif5BF3zgYM9yb0Q1BSUCdDO3H5PlxN97zLCv
         kikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071243; x=1752676043;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ny4OheUvtoLgeKPBXu3zvqh0EKHCtc/bq+iQEnC2Ww=;
        b=AmdYMVH743HNLX8HoLNkE5TdhrSnHTI8QEnFmVbrSe3W1txSv+VcYAHDnhIpUY4Hmy
         ZVn/Qq4Au3O8Zc5xVrYsQB4RMU1xQ+gnpgZcZhN1Nj+P/mmzcUv7+Sa0Ar3DftLpfKnz
         80uDUvnOeT/9vVCh0o9G9qqPp1KeuRqOaKdNHg4FZzp0WUlU1KaYhPViUo07RnNQ9JkL
         Llu+hxsgybdUGqsuOJcX62hDfErgcRjlJxX2kLOwNcQHIKsnTxn0KwZB8zZaYKqUb8V1
         BjndCuTXpa+YpvGIJdITxA+00uhaauBdwD7RcnIsFqz1Gkmxm26MFKw6jvpXtYmrB+3J
         oTaA==
X-Forwarded-Encrypted: i=1; AJvYcCXqXKtzcc8zLaX8a2RxBYiMQLSbvdHPJrWYpE3RKWeNhHZYchZCtiuLEEzJqAxh3rHBviuCzPaT07cO@lists.linux.dev
X-Gm-Message-State: AOJu0YwD4zEhSN8hGxD62v94RIBcEFBs1CbFI7IFzTetv5+gbIdFLrrN
	jq4UPsg1HaeLKZuYgqbYGbt/JH1Q8okPv8wQsPVmxy7VPVC38aB7fZDibMWcT/dlpcrmgtIIwiq
	DRKO+zw==
X-Google-Smtp-Source: AGHT+IGcOXxhoDOk+P/ex+nqUAh1f+wKkBdBcrVKVPPMAEpZzWU3sIlfK65sSX3bA5bYd6D9J3w71Pwer9Y=
X-Received: from pgbcj11.prod.google.com ([2002:a05:6a02:208b:b0:b38:f5cc:7771])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734b:b0:1ee:d418:f764
 with SMTP id adf61e73a8af0-22cdaad6959mr4171366637.38.1752071243305; Wed, 09
 Jul 2025 07:27:23 -0700 (PDT)
Date: Wed, 9 Jul 2025 07:27:21 -0700
In-Reply-To: <20250709141035.70299-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250709141035.70299-1-xiaoyao.li@intel.com>
Message-ID: <aG58SdS7HibYuoW-@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add KVM mail list to the TDX entry
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 09, 2025, Xiaoyao Li wrote:
> KVM is the primary user of TDX within the kernel, and it is KVM that
> provides support for running TDX guests.
> 
> Add the KVM mailing list to the TDX entry so that KVM people can be
> informed of proposed changes and updates related to TDX.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
