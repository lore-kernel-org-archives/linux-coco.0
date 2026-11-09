Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254506;
	b=HRItDrP1S5fMnXapRvilpaaQhhcA3Mu2SCvsvd4wVUR9T3nOy7iZyc+iNspaj39cChUE
	 9y1BCfcfCha1fRLneS4Bh1vw4fCQxOnNPlA0cF9K5o04iykIMdIFuQHfkyP/DV+0aChIi
	 1cd6xg9L8lIRIsHTc1irvNWiLh5WJE0psrAemZZkBPWSobSbIVyCiVaugyx3CY/vFwx25
	 kH7JOgKXYEyU24sOs+HAUtRh6RR2Rzywp4xY3wtbeVKDpjEFTyHIPU9B7leG5/tki3F7t
	 Q7gMdFJFJ7Bx6ZsuELlVlPePK+JJ0edw+eEUvLvIQUrCT2jZAYOX87Oprd0njLWFong==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
	b=qW/nwTygz8tfCXiGwyB4GyCGZkhmmjYvuxSuozL+5y6mQtXO+6SFHiaU8z4xX6SLkajb
	 tVaFgXooQzSRf4hmEI+uPV5O3lRMtWwTkNK4F4vygBDXHD51vmix0W+8RmKHJt4/74578
	 HdYBRNC0dFTkdm41T+Iss91uY9OVg7sSxGsJ8BXFNIzBTd9EzZ30dgbI69E7yA1uRdyCg
	 IXyJ4+qsr9vkihU3MguxEogc83M63Z8T8OR0dWX7Qqe0g+Z47A9bP8kE/bSSF6Z2ZbWPq
	 O6WRZMGIx4b4kjVgNiJAmv1AVKSk918/qWrWwiXd+yy3DA6OvfH1LKC/eV+R6k4jiKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nPqhfJDc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB9606A32A
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 20:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EFB9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nPqhfJDc
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso13196856d6.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 12:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254505; cv=none;
        d=google.com; s=arc-20260327;
        b=dSF3JkqKp+9a/y3DniaF+7xE+Zn9nJYCX6FRLdZmNq74AZgBzGcp2VZrD2INKtp9zF
         rs0riFT9tenvk0PSE/NQeNx1VOIY7eEHR6cYjPiQLSjuHTKBP7aekHt1QhFOC/UrzxlA
         +EIp9S5eqLTuT4DgFTh+hnN2HBuHsEbbih330+BkzZuUWXSEK/0AzvE/Du3BSXO+cfSo
         sYrUfsxeDv8sDgtZck9SaM/NV9KAbfBrRIrIy3f+1xLo20H6aSYOqXNl3RHCZzlONxdq
         jqMGDb/8YInmlW0267jvc5KtvFQqCP0U8dBkFRfyYf3aUUDtZ2Dpsx/uK4fMezGzu4Ys
         HYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        fh=Rx7wiQzpHnqpmdCwnRkCNILM7MLvSrL0exQK6IhrlkY=;
        b=TkxscQrjK78kNZ7zRUHxrgplJ0tGTLaNKDeGabfPDJ4zlfM++FpfLkTjJoSIol5+24
         lKjSOl3K2gB8U585WV/MO6+iJxqK8KvEFDdZUnArTKD7qGF4MgmgcoD8Bt49ks1ucjna
         icahy15upSfujHHx3EWpYYmOzzU8hFFWVu4cUKKRI4pvqZJllRp3QLEbnFJHdEingINx
         CK77hk5rlDFUuUGKoPmhG6cp60nYPqQ0MFY05E39n8QqB2m1LzrzMKWSdNiy4cE9dzMw
         l+lrKPzYqDhB75UrO4owK4b/gyI58fbwp4Z9yD5bdbexOtjtk+/Wc1/zWgXXflLi/Y8k
         7jkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254505; x=1794859305; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        b=nPqhfJDcTQLGpdyN7Qz9qte7K07xA/39CujG8KF5ouZT+7Ynu4x51sUTn2VhUm4rL5
         ROERhZeLIsXAHBSDsDEttZR2qVwxjld+xTepOgjOQny9txs86OLG1NXyyGfJ60LQYQ4T
         Nd0noVejME2Ro1j55VomlCla4YUwHaeOo8SyuOGlKMdSQkn3iXm5t5q/GPiJ2/ebatjt
         DbifIVLs3o31gX8F+xKT/+FAHx42EwxgORMW+TBTcX4gBfISuSQY2UrC+TXBFznAZAOU
         Xv89ugBQxPw17pyI2wV4I/38culEgQAb/AYydATt9zd2l+Hx/ZhIUwgDjdvM/KyxWuWe
         Owtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254505; x=1794859305;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        b=KPEEqMig8ynv9cfB75+6kt7DYLwYkvH3qBbdZgex6WC1YjwhitCsk78e9TPfDm26pA
         IwyhiPcLWcwBe0PrvkuBtaOX84UR0rUNnSxcKq3rNBf7yyCWSVK1nr5qFosT3NQCN3iA
         Eddaye2EHMOOTyB1Q8cm6t/tYOd9BzX5Ct9Avg7hi5BNDXZIYow9Oa01wUHLreIhxncM
         7tuyJ/eXzPH4dahGWgEdFWvKU7xJo4WAZ1+6oCZYdSGBLbbn2A8PFT1WbAoifXSEUgYH
         0BrDujKs1sXAtV3/kv9Rx5JYNY50ju5ZY9EqXEFm+NhDGW+t5LrEl1G7/VHBNJWkv31M
         kVog==
X-Forwarded-Encrypted: i=1; AL+hErHq6f3UU8fxrdVsbq9PiNpPfGTf5xdPKwAPVtV4vqeWhhIXt03rx8tmM5FUwYrThMB3qZYtXeZ/ELjI@lists.linux.dev
X-Gm-Message-State: APuU4Z+GdeUZtFDMyCD3L2zfrURof76GclbIF8WHzov7Zp7YYzfA7jUE
	x7vqQpDiyVRyBHm658AMhTGFmJ8IncRQvjpO0F7YjAtXdFKe33/3xCzqbZ+++Wkw3nUsB7nriTr
	9ib0rgPzX5ZYwsTj7z5Gw6NcjFRcZJXacVs8eLETF
X-Gm-Gg: AYBFou3UBpI8xzwrpbsgDNyNt+NVBqT2xXhRLgRZ2yk5QtOTunbHppUhLQJ0Ct2aDQ6
	8Pj+N31c9C9xO5hxX6WVZa7rNVoXL31FJhfm/YyhvnDtcj/7L/mTd1PpNsTMoSlJxjlVsnMAqVL
	p/Mu1R+rNP/dNuluGxRnxYnh5ZqK+g9gmjN/LceNO9o0McC8HxL/aBgxTaFf3NYEv+jx0hUr9A3
	nFksKyzgmWoAw1/+8NQOdTCI47Wau2wvdRPAsSj9/vacIqdK8k/TvFsGUGO5oh6nP1PVm7zs+Pc
	0faDnL/JOGLfjnJJ36cK91h8Zh3jb/lzSaylYP+p38Ug3STexP5G/ip8npeI6CNNaO1vaf1Qd6A
	hzwI42OhyXrwKcgl+bvqeIGQQNQEGEKQNDBrmGvT1NZTSlYcFvVF0G6P25CpaPEvqJCuXEh8q3v
	S26yToP59nbq+D8b9u2xRx+kyLjYOmZjY9HUDKfGwRc12O
X-Received: by 2002:a05:6214:1d21:b0:91e:9664:4e2b with SMTP id
 6a1803df08f44-91eef7a3c83mr11947696d6.7.1794254504037; Mon, 09 Nov 2026
 12:01:44 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 12:01:43 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 12:01:42 -0800
X-Gm-Features: AclHuK965yyNFO13V7bpMX0YP25CWk-grxkHlMzQ2EkXDGXWn8vJSUwM5EQspQQ
Message-ID: <CAEvNRgG4BGkr5QhNaOQrBLzGp5uy7Bc8Lv0c5a5tp5uUr047nQ@mail.gmail.com>
Subject: Re: [PATCH v16 14/20] KVM: selftests: Set entry point for TDX guest code
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Since the rip register is inaccessible for TDX VMs, we need a different
> way to set the guest entry point for TDX VMs. This is done by writing
> the guest code address to a predefined location in the guest memory and
> loading it into rip as part of the TDX boot code.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
