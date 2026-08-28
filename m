Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD9A3AA9E2
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 22:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956685; cv=pass; b=Wr0lL6Jg+YsQZ+2eq82HdGsrWtwzUDIotq/ZQ57Lu6bwrwA7Ix/ACWU0Oz0Shxau1I10KOW1ZtSMZ28Xt16LLyVdkdhHFTB1IGu0P6KWOfaHadHQS4cCwldext7q5UsSUPozuA1jhD19unRSmsuyhzFIcRIRjdxqvmaOs1PnYws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956685; c=relaxed/simple;
	bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jz4LRKIdRD7x8ZpZV8M44yFVmf81aV3BI80skoS9GubPJ36Hh51bCEPxvGFlwdSYOaMRy7gE2k0sX3L4P8s2rA2B1M5Y7SBY3hl4LL/cOahfIX0wwuEDVHCKEsIDp5DIJF1BBggP09qoyAvA3hqWSIT+NZ32x45Awc8YD9qva1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JQF/knm9; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JQF/knm9"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c01c79467so90791cf.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 15:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787956682; cv=none;
        d=google.com; s=arc-20260327;
        b=P9fKhdyKLo22U010W8y71gu7iqH6empnJNycvW3j8w2JtdQOdJQaHKOfJdBReBDRJT
         CvS5yPI44jsIEl9rbbEIxYi44IDfyZIx9LfQj+EStHVnaBEu5vR68W9KjgcQ+pXjahHw
         KvfQncbNUrlNj1HPRMbsig7IkC6RQpzRzoU7b2BkKXdD+T0d63umzS6hu+zyNcU1WP5d
         5D2MdXyBwCgSgIzvmfI16NYJIFmWuaq8Po1nYAvRaEpjDeFZljjC1RSKrZ5B8fa6BvWg
         FKLMAfMQMQpNHJ+1tc6Vv1lxg/E2nw3Bs8uzzuC7DHERXjCego4Pp2jsSIfbUF/t1DR4
         FVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        fh=KARp1+EvKsJJVc7qau1UPjVFOyVBCygWvJObEsvlmD4=;
        b=NQn909sEKmELEL4XRFGISu/I32brCgaNo41EYGud+kGji2jmwQmSV/5MAVQMBUq3xe
         A8KfPZtgf3rMNunwzM9bx2tGmzyl4lmhC5XlO/HDDUmEIVwLU3usjFN9j9zoEr8oL+tA
         MEqyAblaQaDusXNkoSWjdAe3D1peNOfgz/sMqHg/TpeBV0glwT1Xjt89moRekdWQbKCP
         N64HROrpwg1bo3+l+/INbQQyIFJkWyVacMVX3uINH8K5LBR7DTzK+/xKFonCautyFftr
         +cMbGEkf7Bl/HqCsgsfC/O5ZNLOUlM4eiw64bfNUMQlFE6i4p8rrFmsUql6phxVbWw6l
         OTzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787956682; x=1788561482; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        b=JQF/knm9M4w/OZ8PucNoVcn1LTsDst62VTLvZMze4KUT+PD/Duq3WPlQQtt5lLeA54
         g2eetnLPCR/MmXORI87A+aqcZH5qMpZ00zcYafZztggj1YzP4icPG6+Bohs/ynjEVCVE
         6Mt0abmMZEqlQMIVRQQBE8up6Az3te4vtX8CU0VZyqfiLehe5cICG4twYX2M8zXJ7tH7
         f/thFHPv6Q+kmjzPSpF4dJuJnWXesfgtlDAiXI/Wbkp7ply7aRQ9tnSZEr1e9n2g5C3H
         pOeNWgVSkEfTa7A3R/HxICsk++T/GWrEwtZoVs8/kKFscT7WhSVOgmnPnH8POYmGqY8r
         nDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956682; x=1788561482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        b=iFEL7AKfc/mMkkACHbO4TVGX9JaLSDKIvXnfnbJohnCTrCnCRj2PIevPsCg0qBoRwG
         p8eD7tY+eBrFevdVUHCPINL9auNe/yP6mDERYnPlxXEdSzLT7cVetsufOh+6RApOWgAv
         OpxvmI8OIyR1DAR3ka1r7ANDGL4DR3ysThXQAR+/cz6lx4cYWeOJTL+/SfPiHatntv7F
         mN0u1PaeS86lG16ieWNUGDyoiOT9mqmFVC2xTUHu7cSoPssbKcNsgWS8qvO2RAVfJKv/
         lOQ/s75QRTR/vydB6oD8nyPwp058HGKTQApotsHRONAMERKWhHj1rJlhonDRsrJfyfuJ
         2XUw==
X-Forwarded-Encrypted: i=1; AHgh+Rof299SWsAVnozc1BNpd8dmCuEJ8y6eSG/MGQcTzMThLJ2obIS2YE2psxpgTd3AZlh+5cF92wTc4S1h@lists.linux.dev
X-Gm-Message-State: AFuF++nibHxf3I0dMhT8wVYudyhxVKlSMmenerAxT6TEyvdGR2mobGzG
	/5/YMyq2t1Hn08xW4+FvGve9DIZlg3I4rmJdrfEgTayqURQwtI0GcqXOF806GXb/Im9SxgG+lYl
	T3Txi1jRzFKeri7OJ9dijY+ojFpbyYRlF4baBUGPF
X-Gm-Gg: AR+sD10hxUJ4B22ZglHXJo6BJskT8imT7vO4qlG91L2zR0G0lt29Y74UbiPoMbganwb
	G+QrhgUsU+IYOq37tkGhYJMzfD+a6L9VhpoSkcQNOeZjGvoAxk3PmmL+GzXRu63lKLTTvKugtv1
	ebVzE2WXbkv6tA7GsmxETMFzhx30l3CJDD1ZAE9LkPyKDJz8QI0ga+qEw0vLNHXLP8jn30lWdZn
	AR6PafOuFu1wV84b4xm4QkX0p+0mWYvDyWSKgMV8YXXwoaJ5mI9sl0d9pU3nwMdftTWRbzxnilo
	ifL3ZBCW5xhKVjaQuZ9E/ZD8+zNhJPRO54qi1ok7Q+7WARb08rc6fmmXSlixo79bL7Bk1t3bn5o
	Ux/rlz6vxCQ==
X-Received: by 2002:a05:622a:587:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-52ff741283amr4482141cf.15.1787956681880; Fri, 28 Aug 2026
 15:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-10-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-10-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:37:50 -0700
X-Gm-Features: AcwNN1WYsa0jAMLKRbnvpEBaceT5sA4-DylkYo8BvJ2OG5g_t8qOkwUGOnWXXA0
Message-ID: <CAGtprH82XzEmV+y-riufdOTAzJRwDavUtsRQY5BS3hYMGheD6w@mail.gmail.com>
Subject: Re: [PATCH v9 09/11] x86/virt/tdx: Enable Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization. Dynamic PAMT is a TDX module feature that can reduce this
> memory use by allocating part of the PAMT dynamically.
>
> The TDX module exposes whether Dynamic PAMT is supported via a bit in the
> 'features0' metadata. Unfortunately, the TDX module exposes the feature a=
s
> supported even when it does not support using it with the number of keyid=
s
> currently configured in the BIOS. Since no TDX modules exist today with
> that issue fixed, make the feature default off to prevent users from
> upgrading their kernel and encountering TDX erroring out when trying to
> enable Dynamic PAMT.
>
> For the decision of whether to make it a boot time option and/or compile
> time option, consider that Dynamic PAMT's memory savings are significant
> enough to make it a good default configuration. That is most TDX users
> should want it unless they have strange keyid configurations.
>
> The feature increases the kernel size by 2KB (when TDX is configured in t=
he
> build).
>
> All pieces are in place to enable Dynamic PAMT if it is supported and the
> user passes a kernel parameter.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
