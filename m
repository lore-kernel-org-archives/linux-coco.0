Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B22D7DE9
	for <linux-coco@lists.linux.dev>; Sat, 19 Sep 2026 00:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777648; cv=pass; b=i+BsbFzQRIqTqacD4awsM5MIKkpc1Evx8BOIGmF19Nrf2JY/Y0Wrw63TtE6kxhm7rsHaGBXh2KSFGHRinMl1pBLfEZES49GcR4ck4Z1aga5iUo2GNqZ8BPRxK6z1bdOo1FNaWUhIwy6mZQW8iIItnHnR1V20SgYOG5hwyZux0K0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777648; c=relaxed/simple;
	bh=eRYDYXq8mO0xqUTiGna2hw3VEfXp06tx+s1Wx9I3ALI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCHvX8ENPkar7y9oxyJTIinD2YBDVfvXUKwUmIYGmwM7ehil90N5jRtSkfBPbNYoqqVah/fMqmrbfDOIvIzjRTEgQrEfjRA7aK0op9IbSapTc53rNac39GGQtJqXhbGl3B/iSbushoV0hoDEBGB+fv/e7xMdZlbezVz4AwPAm7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CXVfNfmf; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CXVfNfmf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db33db4de9so44575ad.0
        for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 17:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789777642; cv=none;
        d=google.com; s=arc-20260327;
        b=OBRk+Uj5fIrFAGa8W2hZ5IIf2XqXEg97r7ScvW+hMM6vLg0PmroyI3sAQyGRNlS5iI
         +xi24Kk/+R1ry/0DGOGW+G0e6qMsGyckKRWiXwsDQO/LAiCwjydI8zsA7zCHrli7g4pD
         cdHhnrQGg1tZ7KRIYZvUVkwnQ3mrsz9Z3mJWkMCNkhfovWS38etyEUgB3NkVcgs2DJOs
         qwNujWXC9yg/xyQju30dilUjMs8BN83nKZn6M2+T2vqzC6NwanyvkmBILe7FjZawLJ2Z
         Ke9UOAKgE3JpGKm3owbRKor5szs/GIyPyEQLH7xShLoZVg5kKqyIfuTceq3zcvgj0d3z
         6asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LmqMKPHBB/mFOUskOMGcF49EXv1ypL8clVxsz/MHGR0=;
        fh=KVkfuoMCsSClsErhNxjeasW/ZXo3BwuzKtZ4psveIbk=;
        b=N79pF/gWMyQHYd507Xd49l/58a5ZvWfMeVZsZG2/aVVD4reI6tuPXZgF0/s2QAW148
         4teMzSf+qxIP0e52hHG5XuR36L+Bj/IAjAReVdH8LMXoPzzeH3dfdDs3ERecC/hAHdGY
         kKx0aWm8Oa+TexyEPjgQjvYL1AQYL+DtStAlHR4fFE/kbMK0vFS26TluSzyDRjm0dG+y
         mwYzz3us5kN5HOeWqYx8N73Uj6juJq2tKGpGV3OqUfPBJL35DbmbRgOMLLSpLVTgVj6d
         MSQ4EcZ8upNwGPJdBrbp8EYNQXwZ6OTxcOiymSBpVQftGriAFuR/SLcf0gm9xyVTEEav
         2L/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789777642; x=1790382442; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LmqMKPHBB/mFOUskOMGcF49EXv1ypL8clVxsz/MHGR0=;
        b=CXVfNfmffgE3Rz6VtSlURMi8YDLOC0C07gYmxsvxLiFkbvmcQRVUcjF9sNoHBg1sRx
         pFp+H6BhIbeFc8fkGRuN2f3NL9xFxlPe64WxMpLjbo8HHICbM0VOF/QosjSm64LvBtNp
         MDVc67es0UvNIIRUKBKzjlVR7eUp91ZdGd0nVRVOGy5k1w8JoSSWvCOHzlLluAVmm7XD
         cte8opsfpvCvmSOVcm4YpWFa69lgumImvbE5BC2V57RjR2E4Nbjke+N7r/u6Oy6tMHmz
         xVnRu2GFO6Gbpz6yZhDzQiLwbgmX7sOfoVfhOgd5iF00bVL9/p6N6nU2mwfrt56aOeaJ
         auDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789777642; x=1790382442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmqMKPHBB/mFOUskOMGcF49EXv1ypL8clVxsz/MHGR0=;
        b=LSxzRBmUUyzf0zLiroUw2pxqxcr5MXIfoF7GHodq5eLTRAVzU9zPFQBH95KWSd6l3i
         XGC3UulvmbgYl6l/s55k7JwyGvpapyzQSAOThiq0FV2Boyo/LMLHANx+yjJ8TmrNMhQg
         NHOKu9QE4eAZYL6r0HPfqRn08Cbs2jP53UufRwQ7pfnaoTSNeqjbpFGgjKQ24CorRqR2
         EDIMnrjMXDswb2prG6thMtphd6FdNkYb6LAq8Dk1WE4TF0rgbdK4PjsS2Iv0XJqP/3zC
         hOdOmqs63j9ahe8HcBG9GHoyCUhCWpx5noEj2LoWJl5x5e+1Nw52Cwe9d7RUgzwoUlwu
         U4Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwGLj5Fd6Yzo76VXkFiTnmuxM/dfISDJ7ed5Mtp61w9ifKKNL8iiwcRhBkoyOIAFHmyfcLN4UYHJVze@lists.linux.dev
X-Gm-Message-State: AFuF++k/V/d1PPBkjWWSA/2an0rtxwP/ZXbyORBJzkzFpe0Cxl68EhN3
	kF/a5eimvii8XAdIEfPd2GQ0mnktOGJtrPdYJewZe5JBIilmEspsBWglyLKmQADp+jPoFZBLCcg
	SuSuaImXfhbmRDku0PGxrN6tAFmrR3/3q9iXt9zmy
X-Gm-Gg: AYBFou1q4wShhUsU11OXt95CN+qrqwaVWHLhv50ob3gDULk3AXi7No8T/iXQlQowjf0
	a8foXpzK/dgxkKqTDhtPj5F8x7Tft87qcW7djcXxKIGri431eEKsXPdCJ36pNR47X7ikQVvMQcf
	ebAX5r4I5aHb5HfcDaf7gciq4o6HV9PHpfnVGt04OyG8/pB+6dRvaxLW8PGLTNxPLSlTp1LzdqJ
	vgCDXfvcT4chSv+ToetOAjE9786LMookBXkyUedmYfInK3T8HffIt+RAlwfvIFbT4egLhGTYX8I
	QLbWdbk0ZLRqwVfm1tXT06AXoL0fSvFqkuRHCYevohekT5No8LTTQ0u8wGZZrkJS7htYcTHtppn
	R3is7yLiP5g==
X-Received: by 2002:a17:902:ffce:b0:2d5:db3d:1a44 with SMTP id
 d9443c01a7336-2dec1f19e92mr1672875ad.17.1789777641256; Fri, 18 Sep 2026
 17:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
In-Reply-To: <20260819094903.3060020-1-xiaoyao.li@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 18 Sep 2026 17:27:07 -0700
X-Gm-Features: AcwNN1VzCFV9uA1sUp0UBFirw4LC7YC87Ka8strvz1IBLR6XIOyhlpfD4-o1ujQ
Message-ID: <CAGtprH9a3Cu80coUpg-1sHrmVF2c6ZQOSe1pOTUbEx4_xuHiEA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	nik.borisov@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 2:59=E2=80=AFAM Xiaoyao Li <xiaoyao.li@intel.com> w=
rote:
>
> Xiaoyao Li (9):
>   KVM: TDX: Enable Notify VM exit
>   KVM: TDX: Check if there is valid exit infos based on vp_enter_ret
>   KVM: TDX: Set bits 31:16 to 0 for the synthesized Exit Reason
>   KVM: TDX: Don't assume exit_reason[31:16] is all-0 in
>     tdx_to_vmx_exit_reason()
>   KVM: TDX: Update exit_reason on wait_for_sept_zap return
>   KVM: VMX: Preserve negative return value in vmx_handle_exit() with bus
>     lock detected
>   KVM: VMX: Make handle_bus_lock_vmexit() a shared helper
>   KVM: TDX: Enable Bus Lock VM exit
>   KVM: VMX: Consolidate the exit handler for VMX and TDX

Reviewed-By: Vishal Annapurve <vannapurve@google.com> for the complete seri=
es.


>
>  arch/x86/kvm/vmx/common.h | 20 ++++++++++
>  arch/x86/kvm/vmx/main.c   | 49 ++++++++++++++++++-----
>  arch/x86/kvm/vmx/tdx.c    | 82 ++++++++++++++++++++++++++++++---------
>  arch/x86/kvm/vmx/vmx.c    | 46 ++--------------------
>  4 files changed, 126 insertions(+), 71 deletions(-)
>
>
> base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
> --
> 2.43.0
>
>
