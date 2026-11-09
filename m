Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254189;
	b=i1LBXAYq3do+BeZac7snWqV5T3NseA8loJy82G+rDtYeM8kG3Ki6hAWAzL+SyQkdeHEd
	 GNtMibQlgIpn4Futedf/WiQRm/tqjr4HWYli0LxjQCPF38XvP8VOOAbwOi86uC74Xtf+q
	 +kZjPq9jRUGDBVwburjCLgpk7DmODIBf3u9DT5zlDeAy45LOx39AIwjAjKF+t01s6Qivt
	 p2u+cImGw1/qiwJvbV6C2Ji/zjyzbqW4dhNomh9Ch5ooqEtdUXKno4cFcdyNwyW9K/w2q
	 jw8PEQkR6fc/iqgITpUS0RLv77e5y9xvysS8n0Bf/gZPH2WIRF6DLW6ZA4pUII+zufA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
	b=PXodvZwBKBwUk5/peKXEI8roWBO6FN7rn+27vnbHPdLXCll88KO4EyaDZ2f3pMhfBjDV
	 bGCsP+D5OJimrh8Hwwv8s2fIt9F8fApS45HP4nWAG5ue8XxFLvg7broVdPzQT1XIx310L
	 MjbwbSZnsUypKk8iUV/fr/8J7rDK2pZamyAw5C/vO2jbu2HNV9U3O8DcHtiISZKl0OwdM
	 KmGYPWoQok4TiYv6ENs0gVunEX3v08oBRuUfgJV6KS/ieAN8h8mez3s1rEroF1BC0+oiw
	 GWA4rvkk9kcAlpd4GGzD1Mz/Ha7bgdYDErs6M6x20Qwsqg3ntfDrZ+P0agzPTXQuEZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lDWNigmt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81767606A332
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 19:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81767606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lDWNigmt
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so12080176d6.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 11:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254188; cv=none;
        d=google.com; s=arc-20260327;
        b=KWVHeymeKzQMH7uv45e0FHPEm+HLTahk7T48+Fx3kSS6F6Bw5btVT8VNfoHd7bIZpz
         1t5PK7V0sZZwzpKj74Ge8Me/qM2w8rPGMeT7miSmv9yWhC4e3VbJTtX2PZhtru4huIL+
         EhPktgEKVDGuahcWoGLTPnbWH3RlMkKWta1VjkaJ+wMLSq8WA5lRlgKl8YHR1heQZD2r
         +V6WAqaK00a2hKoz0wmrk4Fm1wxQ5xZlQD8ND/t8feWXcR2/zEfTbhQB2XGABamrtQLq
         VfjKra3dxKZCK/GCYA6WlO8OqQKUUOqrKmSbs5+0xq9l+/4sazyyu3x0qBXiOwD0y6QN
         tYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        fh=k6tcbpGYugUnr4j6LYC7qmUdfFZdKvX0s7aElbtcK1U=;
        b=RS3V9H51YaXNHmpASo60kqJ+0HDxGhqXUcqxS346FY3lYSuVUPyIABgFV/Q697Np3W
         fUgn1Bh1Z+pYLicFrYvrI9Vcse+yuYVbd4COEzxOeeS6NeFoM4dqGcxO8iz805c5/pS1
         o9DwSR4MkQOzS7ceG87sSOuovQbB1NbxKTmJDvUk0HEjgjGGuSuMqbwbgK/z93zqTD/n
         M0EykaC8+GKOlZH70aRu5NNCmMQ4UfuL+bkNCm93E96z2p8a7ROCbZJEQVEUu5xNrcuZ
         BYuETmZlE7jmifsoUcpl+k5umDbSnciBzf40s+V2Lz6zEwgfeQo8LB2Uu6fC2zQOwcom
         nriw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254188; x=1794858988; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        b=lDWNigmtWy1thRn1tc96mnqmYdMG69A+1ZXMPvfH/cC/H5GvQIfLVClqdkZ4X5ZVZU
         1AX1YnE/lTVwJ3sKWjxryY7YdqrZ0AZjPi0EXe0Qeuv9BGLzZY68yRSwYzZcvzhcgXj9
         5cNXDTHtlcLUc7Gwo1YKu727q6foijamHgncQKw+faxvL3lc3piTRblNor0YxQEsj4hv
         x4U9Eb/5vyOs9HzQl6XY+XYmUSZu8hmpt4P3DLK/OhDDiEuhSEWGs3HW21Wk7YE8s7Us
         +K9WXX7D1285hrie39R2TscSMZxr/6RrAHnahhP28Jb+EiT/TH6LyebdO6GO+EGSm1zh
         bkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254188; x=1794858988;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        b=dzH7ehp/fIASPyMVCASI9VmwmvTx5etm/HlFUWgRGX0LpOXO7SkyotXZY5MFcWZ5OJ
         AkngOuqiu6wo12g2eQJtM+QGB/+tz07aGiQF9tqQs0afqLUzZtHEHEK8R4/bRPtEvkKx
         GgvtoNHvwD3XFcbr14/7u8/MILbNJSfPG5ehThitQPiohP2Lrg2t2zvCGtwt5DAXAra+
         LI2/MM2CxqKxmg+0Zrv7bDbMGsASOwLzen2HWZC46ZRc7+AhaUOFw7AkytcSFtuvU2j1
         WYEK5I69h0KrzEb079GXtQ9rPweokgQgQiJssr/+c3u+af0MT1bFTD9CrNaJ9nSMMRB5
         Si/A==
X-Forwarded-Encrypted: i=1; AL+hErFKsrfDANvDhKpH584JWnOLDA8IgHxayV+/JXaJM+A3c2TggmBFMsgdA/3oPCqFPdJqxJ+TuV/2Vcdg@lists.linux.dev
X-Gm-Message-State: APuU4Z/BmMg8OpzgHkxsx2mrrj4mvc48ZdPDWAlWORWz7W6pZOQFLg1E
	P0y2XHzKTrxd5+zzXUy67PyZJt8tfewzujp+XHeXiC4We+s2jQvrEwSZOkLyclAFHTOyah7Y+T2
	MptaxcQGHbcb1M58MzpCnEs6oTCyR0Ud7OR502Dx2
X-Gm-Gg: AYBFou0ZT3WNYK86AuIAsklx8s72QFqTZ/7dBTpMsIun+ssvMiO2gw0ji4qHDbHE8Ou
	ZM1lWE5A0NlMQ4/Ni/fvyW0QdJTCnfHm55YfIymBD4gGJgoWPlDZ/hs6X/BLYGxLGv08+5uZL9D
	8LzpLkPt+q3cEDUjQF3kLnetlziJx5edvmKHboxvnVsZ2W51EQK1zqTsUnbSm7RyhP8k0j76OhM
	XFlwWs3rcmWQSzvGLe0SFN/051BZlB5QWmtWmafB+o6ySDsFv8gzEPWYVNwm7Zjae36MSfHPyka
	a4iDxWjodzWA089dLPVNU7Ih+/jENhLMAiuNT3MYFOzkZH4V4iYWLjm00zgh2hmNrQe5eTG2Jhu
	nVWyMnQfcakGs84jD2C8o+eQqGZDqsZiE8raH0HLE5JhNas8WlKwBbl5iJF5eqCTPvRTTm8vOPK
	fqEq2gztHMbkmWm87LSSRlDSZeWKmjv7t3b5xFSIO3kNyk
X-Received: by 2002:a05:6214:1d21:b0:91e:9664:4e2b with SMTP id
 6a1803df08f44-91eef7a3c83mr11733606d6.7.1794254187357; Mon, 09 Nov 2026
 11:56:27 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:56:26 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:56:26 -0800
X-Gm-Features: AclHuK-1WjXMX68h1oPEz4A9GDozdAxxlHkeQ9giBYSNuXqnEZTuJ6BoJAHDbqQ
Message-ID: <CAEvNRgFTor8fZzRRMMv5cXvxu7NCiKEOpbh77HSHGEdRRbt9EA@mail.gmail.com>
Subject: Re: [PATCH v16 11/20] KVM: selftests: Require guest_memfd for TDX VMs
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

> Force guest_memfd for TDX VMs.
>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index d42e201eba76..b73a7bfe8531 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -494,7 +494,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
>  static bool is_guest_memfd_required(struct vm_shape shape)
>  {
>  #ifdef __x86_64__
> -	return shape.type == KVM_X86_SNP_VM;
> +	return shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM;
>  #else
>  	return false;
>  #endif
>
> --
> 2.56.0.455.g6c5a503b38-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
