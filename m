Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B937BE6C
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953872; cv=pass; b=e7BMeG7b8G2Pin1cACt+Oh9PgoEwLXZObq2tj/xP+OZc0v8yEFR4dv7F4z0fkBmELqVcxkyuFhQS4iE0SnKy1Stua45I7uMDl0fCJYvXJ/bACMV3bm78bqc1ctICn7UA0D/q4GEBRtpNaUmkOgYdsEu8KsRGluWaWu2zVon0DSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953872; c=relaxed/simple;
	bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/KypRWZyRBqBmgwbEpuyugEaOKyIxzirqX+vZZviz3ZSEWqYAAwSIsal2q2YZlFL4X7tQyJZIsOOqbm4os1eXMq9cHnaAGwzQQ55w6Z/e3sM/OUDBd5hHDLz8EsE4BZ+63G0BNFdr/XGUfmmF+p0w0VHmJcTemqgF3GgazBUlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UFJfialA; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UFJfialA"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c10e86e52so38201cf.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 14:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787953868; cv=none;
        d=google.com; s=arc-20260327;
        b=XmwOPjTwdNZEsDHyCHS57Oah8g5ZyXlQECSovC9GPdn8g6DREhAAlwNQTI0OZ0GBpo
         cOeP+gaPBtk5kmU3zmF170gmhptVOEwPSOEpehBlq5bi5L8FX7GZ1K+HuBcvS5THSutN
         GYqUNIlT3fffcY7j4lDehmwVEEqakwrAKXzDf95AhOLfIhMYe6TdHhfT6x1qrS2QWoSc
         ZTxSB4ZFBG5OexqB0PLp5OUfS0kWdSLHYSoNcyHc/aMB565ShI+5FxUTxhEInK1mPWwL
         /gof8xuI473B13y2SOHPEeTdotzhDGRVRxBjRgykPSUKiHZAIWP2icGuIVy+5vtCvnzP
         LQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        fh=pFOxc0iMqz6ZtY2faw8f0djzEYSYOy0HBeXctKOJFA0=;
        b=gp/oqrG5UpJ6XvzJiiUVwe9TmJwbZ03x/3T1vpwfGfn1Ywq1s2ICjMgDbuPqgUazHY
         ke2E2czFXWgHMp8RonruM4VxFuyyCWW5WS4YrfA9gbe49x9UjOCSd/+Rzt5gv1J3ifIo
         Ff6N5z/NR9PrRchWT0qrjUVxV0QNm1qzZT5FbAGZ1jFkp0hnoW32e9RB4fqdIpaRRO5L
         TLgw7jM5088WzxKKs8XUoHZIgkocpftrwpURlUlPBRaI/l7YTOQoFN+ttOOiyYRBaGTL
         zQAIqsWYmRIh5fN+nbn9SpyK1v4xSJI6RhMs1ZSK06VdzFkMspVPddNX8GWAiwElR7mW
         tdBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787953868; x=1788558668; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        b=UFJfialAY/eXAjc4tfBNeg9Gs71MtrR8+WqP063WZ2r0bP4YB+SsrfzC2ZZdTmOKkJ
         KFHR6QyZIQ+LNMuG4lgSZx5mk6aNELUNNXF1VVFuwmhgKJk3swwzVPiPUYnt+r9Lrgo6
         L49rbMBEU32FLHdblCOaIoS9J5HaE9Z9OIS6A4Ddi929rQ2Zcovygn0/fHvLELz+qxSh
         rapKRd/ZiF5Wwdkcl/IyB1QMarVAO2VWljhzG1eZH8uvgK9ok7HReqB3JbgJArs8Yl6Q
         pAZmbdD/Q8AZkKevVhhlOoNXXuKsWlwm+XqnjLTwvTw4TxAYG+dohUmVVclbfz11ylN7
         UM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953868; x=1788558668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        b=rLPc7GXRpd5fmoRttJHxrYhbp77tdjrfkovpygfBRTmv1nSTriXI6byNJTiAjIvnU6
         fUJUMVra4fFOI7Yn9P1MKME+4+00b5KzYWdRcNfVJ3EDo+kx9ft0JhMFGviD7h7Ef89F
         eUpEpweqqY4+o+iaqmpysGtJm9XSWAL8JUSNRoC8SLVu8Rbsb/VjaDVHdWZlynQoqO4j
         iJsOqG8vXPhFutUaYgQrpkeDTIxTlgqv09LQQdLc1VcjDSHBu0IUQqfBWQB+wvvNqNwx
         TsZS06zvEuRgZAYS08OS9GKx6cBfu0r1QqRx2Vqct+IlRrhCc/C13CpuEGYvlOZz6oNb
         GM6Q==
X-Forwarded-Encrypted: i=1; AHgh+RogKfyBVYxwetNZHi7dQjnj/EuFb/RIqJoHQAmzsvElv/sUUwttoaGsjRXuTdKOQWsxxkmCmADPc3vJ@lists.linux.dev
X-Gm-Message-State: AFuF++nGJCt2dh38Omu3GVCx1aGxFSlds2MBdnX3NLx13OjMmAIpHjTM
	IQCv2xkUwxYkxzbjxl5rb9zf2B1jtR8G3mKEi29ZoAJECLXTsJETGdREnvL0qSBSaU7POP/vmOl
	EkYfn3/irXsq90kcJKsSO+rH/CbiiKkQuPeMpz70T
X-Gm-Gg: AR+sD13cSeWheuuy1cxO+BECQghcZWSHn4uWBs0cgb/yB6wvixNCVXSe1fUeo7xJs9g
	sEtPZ44qQFdKQCgcF7iyTJwxSg19ZqmcibcXS6AvYR6uMoic0GWCLwDisfvSKBwc+VCp2R707dO
	Nzr+xv8SW7VbjI2TGLylws6NT3ricud75iRtyLpFiskDxDtlUJvizM9HzGxhkGmNSPoh3HuaRg0
	G+JLFae4UV+s3DK2b1P2Lvl82JVoGoWYOvd4JdILH47fkrhIKteuP1M44b8PXDjQzyp+TV9PcYP
	zOP0PInWM5i4ugl/CC+IFo8RX+haTCiZ5ek777MLyiDa4RSZaGpyObw34YvjMIRfNj5Dom9hLkQ
	=
X-Received: by 2002:a05:622a:c18:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52ff715be0cmr4613111cf.11.1787953867807; Fri, 28 Aug 2026
 14:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-7-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-7-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 14:50:56 -0700
X-Gm-Features: AcwNN1WH8NGHkZoUiv8RzQRpWDdLlBSrkCbScz0MXSyRTt5NyzGO5osqGDfsOxU
Message-ID: <CAGtprH_6-KDfDbtZCq+F+2_Qzu7+Wkc_2ukJRniWTgVkNvyVqA@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> Use control page helpers for allocating and freeing TD control structures=
,
> such that these operations can work for Dynamic PAMT.
>
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must ensure PAMT backing is installe=
d
> for any 4KB page being gifted to the TDX module, and must tear down the
> backing when all associated gifted pages are reclaimed.
>
> TD scoped control pages (TDR, TDCS) and vCPU scoped control pages (TDVPR,
> TDCX) are all handed to the TDX module at 4KB page size and are therefore
> subject to this requirement. Replace the raw alloc_page()/__free_page()
> calls for these pages with tdx_alloc/free_control_page().
>
> Switching between special Dynamic PAMT operations or normal page
> alloc/free operations is handled internally in
> tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around the=
se
> calls. Just call them unconditionally. Similarly, drop the NULL checks
> before freeing, as tdx_free_control_page() handles NULL internally.
>
> No functional change intended when Dynamic PAMT is not in use.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
