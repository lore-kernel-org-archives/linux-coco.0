Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184AA2B9BA
	for <linux-coco@lists.linux.dev>; Tue, 16 Dec 2025 00:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844024; cv=pass; b=kgRIkpFqZZKeD3e++ikJXjeGD+AciERld/OcsVQb9uGg6jETSEt5wP1eB3/QBDID+Cs9wxnW+Xq41H6M6t4cfoRi5x1LkqZiyhv36ndYREBYXqW1JqCwxOmVxtnfI0+ftKKV6Zfv6wARxGbntU4nEDTQBHR5OXi63AMhVYA7dTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844024; c=relaxed/simple;
	bh=HRbRCmq0SM7DaTEQJ8+c85iPZjE4VDGJxFWUVma8wJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLGBL3CO8qYX1F7uzuhB5BHyLIxIFBoiU7bZTWxg9PuYjaGM+NToqeQnf0Fw8qWo1aSakqR0hYFBgauBT6cscBS8YhzMuNO6hxA27tKM/GvY48dv7bQwG38kUglEidfBrvKSCB3GAZ+DIj1itcAS79zqQ+ZKXspeL5YMdyfNdyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=02WjlP+F; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="02WjlP+F"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29e7ec26e3dso46565ad.0
        for <linux-coco@lists.linux.dev>; Mon, 15 Dec 2025 16:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765844022; cv=none;
        d=google.com; s=arc-20240605;
        b=UlYUef5rASsa1zZHUCvuzpseNHEb2jz6sDayBJLa8FDVa3dm2iYwDyI6UqZkePidVu
         m3GifT4gYc5rMvdNiaqKVGOLa47C0zn5FWVd3MrA2CIE5wMSqBW+xb5/37dzFW7kgpi1
         1slMzib0Q6bMgFgHD7qv7SXxB9GCz5gPuV9DtvmpiivtRquSuhekp8cvLfMwTLTASod/
         ZL42deVmSIs+YMHDowhY2iaWHZyVQ5mnE1DvrSujl25E3w6pO51TNoIeFM/m8X8gyS/s
         wZgHtykfLA+h/1P0mf+7Ttyv4+LnknPKp7NFPds6ECpPggI1JLhco64pp/ibQHnv0OrS
         2P1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dBvvdjAGagUjLVl9YfrF0CaB+uVsXDQGkPun9qqTA8c=;
        fh=4qymkvQ4hi7gMBvxFbUtyJiqAAHvskTF1DCOA0R6Wp4=;
        b=McKA2LVRPrTW6SZbLmqp287yRazUZKmzDTxwd0PyIlYwK/DGAGBe2XGsSEHaG1GCZH
         C0jfYnBsug0+XGFbSkng1AkOXg32ytt/KynNM/dJxnwCWJozErIcwh3OFhCECV/eC6gK
         PcqplEDvUeFRHZVNkC2NwK5ecV+ugMgwWJ1XVEVKUsnzxuTC+4xgdbPcvUik27H8k3cB
         7ZOx+GpbqKJd3QQNX296VY7LTTKTxCgNHEsVNkns8AURx8MeH3fK0OOxh9CpxavCkkhW
         duL25FVcnKzl/bzcbv6zD7ORwBVxW5816C5BVTr+ORcmCTu6VKOxfA9e7C8Ct26ZJK8e
         SSPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765844022; x=1766448822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBvvdjAGagUjLVl9YfrF0CaB+uVsXDQGkPun9qqTA8c=;
        b=02WjlP+FhHKHIKeCUqLllcR9F+bIh5iuG6QPH+tufApvmoC/lWlNH+VVm6Mvbjgxol
         FAWA0xhva53tcVgKe/laMYQVW86epaseqksfJppyQMCbRbYHlG5a4bOnAadiN3G5DkFY
         0otyTBCmtkbU/DxfpeLPTfv4xzTjGeTx21St72cCCTd5xudcd/DmLU720HbJC6QSAnOx
         uh1qpDq3XnW2lDjficevoEPxeWhTsf+z5ovviBj9E9YhiM65eqC3bEKPY9TQM3yiZMNm
         LuqMxBVZfIdl36RGehoOP5mSgFZ7kGu96lxcQyqEHDsVk9csGJZWMdNQTq+jG1UlM1rU
         E4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765844022; x=1766448822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dBvvdjAGagUjLVl9YfrF0CaB+uVsXDQGkPun9qqTA8c=;
        b=ph5zoGco6ifuk6zldQgLwWX5Z0zCwuYl8O+6UQnsaFQQfHYn2s5TN8ZD6zw+HKGYI9
         RMSbDsITt68j5vqDwp2FzgHq8IETeGhEDZe8tu7bKwNzT8QwV99PmMumRDV5XQUSEiLs
         K9TZoFme29ZWOy7D5mlpsdB+JIPbGUlAWeepN4FgpgB3C4Ne4ffYxn631y99cg2GeygG
         MF58Xky0r7U8wcH+RRggNBMYF2H0JrFYkY9TaKI0TBDFLqfcTkvK+/Ki+E7DXfNEBgR8
         LwIviQDo2bmTp1l7VbWlNpvwCUSYwGzg3E97mKB/whoYJcJukr7M+4ncBely+dwVtF02
         m6mw==
X-Forwarded-Encrypted: i=1; AJvYcCX83QGaavUvTnEw6+zajTeDyHdVaPhONCQNba5yT3QGxwN4y0GWzAdhbuF64r0Jjwk8aBhguS0btP9/@lists.linux.dev
X-Gm-Message-State: AOJu0YzJlV8lcwtoW9iD9NImYjVdlr7kTUrd7KVYdFJ68Zz4mLRstSW8
	++vzd2wenhHaA4Vk3Iwkv3EhOZoVFBz43FYm7QrNilkYl8pV1ZMQcOjFv1t6cuRmjP9+/KXmtMc
	Iiq0RKg21xb3Q/OBPd5oCRdVxi/OZESe+VbrZy9O8
X-Gm-Gg: AY/fxX7+De+J9ItW5snFewm2msngYbUFrXli3T3uBPz/hJfiB2hvKbzxYXDyDyLVzIy
	0GgDePxJMGO0HaduJVdgbeLeeghQDrtG7s5nAYxE510eszO7pC7tuVFuAA+d0zyLuK48XB7zK4V
	jxYzoWSVjjoRuddqSUysxCFXC6xpJjk0rCKPr3T2sB5hh33m9+k8slUxZBL5sahdIaocZz/XM3b
	hKqo+jxuas+NmLANKod6VmVSjObRj85UUTFU/yT+lm80SYdaPeZKODSHr9q9+sTUxf52OW0G7Ks
	+wLPDl+O+Ux6jqp/pXKmXWsXS1KO
X-Google-Smtp-Source: AGHT+IFoirOvNMJpKn6tP51PRi96WA/WP8WHHlPJAFYlT/+WZt2BNZRZRHngFXZC5p9GdQCCqI5te5+CZ9A/FzrtBPg=
X-Received: by 2002:a05:7022:ef14:b0:119:e56b:c1e3 with SMTP id
 a92af1059eb24-12057217cb7mr94c88.14.1765844021847; Mon, 15 Dec 2025 16:13:41
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215153411.3613928-1-michael.roth@amd.com> <20251215153411.3613928-3-michael.roth@amd.com>
In-Reply-To: <20251215153411.3613928-3-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 15 Dec 2025 16:13:29 -0800
X-Gm-Features: AQt7F2r7bucqAHi7gjHHb4xeDTJY1rA6zwbPyLTqR3xjOn4AhUq7dG2mlIrjznA
Message-ID: <CAGtprH_4K9TAH1DoeAW-UHTpMY2sNr8UUehoCPX_SKSQBNoERQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] KVM: guest_memfd: Remove preparation tracking
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	seanjc@google.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:35=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> guest_memfd currently uses the folio uptodate flag to track:
>
>   1) whether or not a page has been cleared before initial usage
>   2) whether or not the architecture hooks have been issued to put the
>      page in a private state as defined by the architecture
>
> In practice, 2) is only actually being tracked for SEV-SNP VMs, and
> there do not seem to be any plans/reasons that would suggest this will
> change in the future, so this additional tracking/complexity is not
> really providing any general benefit to guest_memfd users. Future plans
> around in-place conversion and hugepage support, where the per-folio
> uptodate flag is planned to be used purely to track the initial clearing
> of folios, whereas conversion operations could trigger multiple
> transitions between 'prepared' and 'unprepared' and thus need separate
> tracking, will make the burden of tracking this information within
> guest_memfd even more complex, since preparation generally happens
> during fault time, on the "read-side" of any global locks that might
> protect state tracked by guest_memfd, and so may require more complex
> locking schemes to allow for concurrent handling of page faults for
> multiple vCPUs where the "preparedness" state tracked by guest_memfd
> might need to be updated as part of handling the fault.
>
> Instead of keeping this current/future complexity within guest_memfd for
> what is essentially just SEV-SNP, just drop the tracking for 2) and have
> the arch-specific preparation hooks get triggered unconditionally on
> every fault so the arch-specific hooks can check the preparation state
> directly and decide whether or not a folio still needs additional
> preparation. In the case of SEV-SNP, the preparation state is already
> checked again via the preparation hooks to avoid double-preparation, so
> nothing extra needs to be done to update the handling of things there.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>

Reviewed-By: Vishal Annapurve <vannapurve@google.com>
Tested-By: Vishal Annapurve <vannapurve@google.com>
