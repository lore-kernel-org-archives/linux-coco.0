Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240044;
	b=U1cwtXD8b857jiM2EH242UoF+AZsvT0t+j+ADmoIjFc+XEZU0Mei0ZbL2egBWR35y8WV
	 7wPBwnHmpMYrZSPeGo8hFFLVt3cmVVLnYiYG0F5v/NRwGvcHo6CtWIMiyhENow97RhCsL
	 KYIcI4hOSzS88rmJDPWpDW+Pfv/7MBTwzSDHlPTInd4pM9srPAEMLBdItPYk7dW8Fedmy
	 abVCGIoSR0nzYwazOBj7CZ0plIuEcxxBfEJ6LL7ABEo6OIALAvccR/tvJhE5a/OSVSP3g
	 HtRcQopGJcG7zkPO7VDjXc4r7we7OBdz1aOBrQiy/vYfQg+T8lL8Zpnee2vhHZAX6wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
	b=y4VPRaGOexqVTNyM+E13lWmV1Ogde0sFjaR9BG6Sv+ysnj7ue/t33737pCTi9e8O2Y9M
	 jOmqWqCJyXicU2L+LEv4cXMu2tk/aBkyrKTfknKcdiIgbMfA4H5lUgFUKLhP/W4LrTBBp
	 4jLEoIBJNa2lXhmCFgvxmTFHAfpvrNCxBu1xvhym/e5iWX/piFCxBnZADWmfGdcn61dnW
	 xNZPz6N8VsNYvIEfbQDifMBBwt1g0DcdxAJKuJKQKxg4O2yzshdvCBF4KHB6qtx2bd+fv
	 mnYWjtJFZSXLy2Z5qRLE1Bk6sRGybkap/vRlCIlOztaaBeStU73+tp9OoSxP57najng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="PsJ+/bnZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FB6082BD5
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 16:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939FB6082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PsJ+/bnZ
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ec396c93dso12257256d6.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 08:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240042; cv=none;
        d=google.com; s=arc-20260327;
        b=CHcX6YB+mw5s7RNZGjaYQlJqKZNAk1Imy3Abrl+e1bSLJIoSFatBrexl+mI1feUf8H
         5/Zsk3oMyMQV1NTOikXREL8tffQIPBMIX1tAqa3vmEKLkH6vxZp58R8PT1hZKyR2Wyq5
         jLfWUK+cpOdcHGf6U7Fv5CTEIrY+GYwlEaaQ/rMF2vl8PZXCeAEtJHGt+y0GEz4HB3Gf
         nieMjB//Em873D4LXUfj61YG8a24yOtazBoCMtZFqxv76ra5Mish0iMHLynqHUZiKSSj
         jWAv0M15u4/DxVXn2LqsLQOiGVOrYl5Xplq/mjIPkVKeUiUC63S/1/YfOV+CqKh4I/DM
         skWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        fh=esoZI2PPeB8y5V63xJMOwJ+h5ibYpNIUheVYwh7808k=;
        b=kGHQGG1su+nqmKdu3MoEfo68aPI1YMBW5lchgNYdW74AVsRP6gTwXQriweJPZ2xThw
         EL0Eh8RhWoXyPCoSXPwgZNFC4mSMBbW4R1novhFpAk3nrWGCYLmJV0qo5zg1BYM+f7e0
         g4sTwsWqop8TYIw3AXxXNb2P9XYNzvIzXW2VIQQno0LTu3SxzIQmwlMEQSjfaFCoGOhb
         XwVBWAzILx+qPNqLdQ8cnBcBhfibaQaelzDYOVdEk3Xsbn9lyRYUvYNI/e+tAeFWi4GR
         fDS6aSes6BA8HGQU2BWew+0o0A5uLLQDdibBjNBxCWV68a5SdpQXRY2D4nblcluQHnAQ
         X+tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794240042; x=1794844842; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        b=PsJ+/bnZTMqmfXI/yBbX+8gxf5Zs6+dFqcAPU6gL/g21E4cbqkL53z0w/ZIF6p0r0R
         mmJImBP6fhBZSpa5LqA887ei1nDQWgIrmP4gOdrpUzQtVulm429NebOXsc4A4ql1yMGN
         uEfOchmVsS/rjtwGIznxq8CFmzlWFyoUS32iJl2Q3CQtNmIqVOcaOSzll+gMNl9LgpH3
         8i//9srII3uJ/LMteC7fqOeVqLhuHC3autJB2c67J3HzmCSD6nUDM0l+ExSj4Ay9YADa
         ZvCJ26eUEjoRRc5ALx/TjVOPxzogEqJkh9fjiABnyx7lHY8oACshkLXCqQdAuSULguwO
         NvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240042; x=1794844842;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        b=bzmQUbNvW3B2cXIEA6cC6+qNwj8lbPKoMMJSw1EVXIwmvYmY4DNHB0YwCUYLDAsHsa
         5rky7Tdz1RL5Ec7EPXno4YPxkD45tqQVUy2GBg+lvxKoiJP+iwa0X3V4qof4ptBSRt6J
         tjR+QhyRwOAZLRiBJ/4gRnadSU6WdKANxqYptrcYrGS+xGBs6Jxal7Kfico0tCKc6zrM
         RigHMquaJQcl7n0CjBFTIt27/zvuqx6EXINkRgCKo6w1IDyKRsEfG6tFH1K5bxu0XZe4
         mUU5q13sHPtzoRJKT5lPAiqOZaSC4Vhvn8fw+RygLbN8QhUlSTHfQcgYlo7zQGNGEaQn
         Ql0Q==
X-Forwarded-Encrypted: i=1; AL+hErGzz3ZjsI2nn02N+vuSRwAqW96NfL87OjaxjvOVKzvWmfcRseYZiG5BgRDhRg0KH9Bm3OQMlR8TmTgM@lists.linux.dev
X-Gm-Message-State: APuU4Z+aSZMEx0TfTCv7+LmBF6oiZCMRFdkNAlqe0pobQERj803gdun0
	RuVXgqi9kO5xPJrC1Ix2vhEdw+6XGhekt0weWZ3kqsZ811aliHErA0GU4VOJoTnMxsjeeVYkid1
	KDDtM/jwiY069EUYt8hvtOWulsVtHBDrrgbOS+PYg
X-Gm-Gg: AYBFou3IlDgW3OFN4gmsi9YAHBPP65ASNadUCj7WvgfwNSKQHC9+HU37VLS4NpNLSlr
	28qs7253eovLu879/eHvnnFGnZVCphE+S4dKcZcUtD6IpK3jc+xGDvg+0eGFbQ6XC4Vp6pYTVpk
	Zex4vFYVx9cFB3GQnb54f37Qfg0VNDX+LGlNKFY8dwMTmN82DVsebTIRzIljjTUy2GGyBXN/fb5
	i4R63DfkEATeyFhaLomG9hKdw5BR9C0hwOdFbE1vazq5JwVRbvmvWGRhCJAxsTr1LWUandYxOSP
	gOrDWnMEInelOGwDfIf+8o0P6AA3HuLu/eOBTbJlsE7TOsACNq7HHxjgzcCYFXFshdJbsMFMlan
	QQT/QagnwQUAGAxdtkptRd5aby3h7bC+NAYikR5B3XKTIcxXwItYBXRO3+njjhmXomA==
X-Received: by 2002:a05:6214:5402:b0:91e:ee31:55ba with SMTP id
 6a1803df08f44-91eef8c841emr97756d6.57.1794240035928; Mon, 09 Nov 2026
 08:00:35 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 08:00:34 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 08:00:34 -0800
X-Gm-Features: AclHuK8G0EZDW3tY7sTDlhlnaXZOXK3ScUEr2v83dxDnmQ6yymeVPIAKQ5tIQLE
Message-ID: <CAEvNRgHhzFxfXB+jXy+RCwTWevFTEW3RH4q51xztrFZYa4Xe_w@mail.gmail.com>
Subject: Re: [PATCH v16 02/20] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
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
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
>
> Initialize the TDX S-bit and the GPA tag mask in
> kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
> is initialized for SEV VMs.
>
> The TDX S-bit is used to distinguish between shared and private guest
> physical addresses. Its position is determined by the guest physical
> address width, which is either 48 or 52 bits for current TDX
> implementations.
>
> Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> Co-developed-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>
