Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021CD1547D8
	for <linux-coco@lists.linux.dev>; Wed, 20 Nov 2024 04:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732078466; cv=none; b=vAQnrQyGG1NBZ4GaXDZbXrJalXUqF4i2/lEMMX+NWDaK5pYldkQ6QIDeuk3oXCDc0ohezAyJdO/4HzfMd64/0R6vK9PNBoG92jlslH7B/aCrIRoBwk2uGgnwP5kXlCCsHtadAmzOTi20jOBAzNR7EeCP11b88duzKYIUWAzJFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732078466; c=relaxed/simple;
	bh=Ljz1BrQoWBFpeQ9m1RBteXaIKOeLwRVMaB6NrIwZjxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDYk+q7SQL/n3GEIcIbyUg9zaQr5pH1KBqjRn2nL0x33bGS6qLT4rLb+BC2mJBhBLTN1n15lzUC4tXUa92FTkxtUZRt/7cZY2efYAyXolMOI/WY9pstbj45T6aYKcL6xOxjLn3aiEtDxUoMsGygznKMHsvORnGx5xfY6OM9uYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I9sGLAeW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I9sGLAeW"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso893259766b.1
        for <linux-coco@lists.linux.dev>; Tue, 19 Nov 2024 20:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732078463; x=1732683263; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+w9doJ3O9i/6/XMKrJrXKq0re8dFhV90KwO8YySlAAY=;
        b=I9sGLAeW72NUzPqklRAadHApTAnePC8sobyGnxxdNhiR7nWJOEDUEo4+PK9aQbbB23
         AvdB7MeenT79vzy3akewjGQ/kYmhDPU+di1lLa5MeFQikEt93eyLnRWkXh2kVdzg1VU2
         Qrqv0q413rc8xTMO1+BBrF0kkprCIf2GV4RUuEn3jP+5V9AgkC921QuvnA/CpO2aw093
         lCpy7Bb9sDJBky8UvTXoL5/RleLR/Rc2YVoe5HHy3GBTKxa69f1nLWLG6AsLhDFaLM3H
         QM8cApymZe9eKFcixJmn9iJCzxJIvAlWXqZOHJ2rVhl9RjsxoxQboBHMplnnDgn/ri76
         UhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732078463; x=1732683263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+w9doJ3O9i/6/XMKrJrXKq0re8dFhV90KwO8YySlAAY=;
        b=dNA10KecyxN6WTxf6jlg/9OOVbtP/YAFvEoEMFgm6uhkcvKh4BV7/vLXDfx+D2MIQn
         mpoEYFZ7WDoQEHTRzfJ2xqWrhP0AMRmHNEGsDDjmUrAugrA6TKGvfJDIrsuZV/pExgLv
         IpzowWp7Ha353c9/UCNn6b29+hfwsFrlNjzRchiSOgt2rNpjnAVjk6FACQKrJSq9+uQ8
         egjc+TRKOLsohZIzoxxMBus9ITFmXBAH7PRQNcFeVNySWpuf8Gx1ee4/Jc5qHE2tuyp3
         Emv10oOJGCFmKhgyQTh+C6ph5hxIiZGBEIAzaDzQJPXWrKjpYVcqxB7PXGNBKBbdol+s
         BUtw==
X-Forwarded-Encrypted: i=1; AJvYcCVJkW78byVehIBGIZUsn0mJLg8JxXRiGUAchEQfd6JWaq2qlivCc1KANHgntDy3xZpS+16ND46QK3ZQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxDlTAuFVsb6bO6pCZdKMvWtUeOxZ7dG7Bs20a/m5g4M3R60MSo
	rO5c6Ojl9MXFh/1W/tQxvBwtFP4ul8mOGmpI99WKl7xkDujwyZxwkHiaiabW017616GD+QfyW1i
	54xTVi3X525fBs5udGxOpuDZgcmeAoMLG5B3G
X-Google-Smtp-Source: AGHT+IEos66313b6UbkDPdhPCR7c7Rdq6Wz6ePwqCzAV+nNb/KnIiVj6Io9mpvbYz+26LP7GyAuEAEv8qrF03Msz1Og=
X-Received: by 2002:a17:906:dacc:b0:aa4:9ab1:196a with SMTP id
 a640c23a62f3a-aa4dd551c83mr107508966b.21.1732078463132; Tue, 19 Nov 2024
 20:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119133513.3612633-1-michael.roth@amd.com> <20241119133513.3612633-2-michael.roth@amd.com>
In-Reply-To: <20241119133513.3612633-2-michael.roth@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 19 Nov 2024 20:54:12 -0800
Message-ID: <CAAH4kHZ_A7-dNyMiyrZ2p46te=Xi7SRosS_kSjYvG6sJTcmb7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: Introduce KVM_EXIT_COCO exit type
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, jroedel@suse.de, thomas.lendacky@amd.com, 
	pgonda@google.com, ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:51=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> +struct kvm_exit_coco {
> +#define KVM_EXIT_COCO_REQ_CERTS                0
> +#define KVM_EXIT_COCO_MAX              1
> +       __u8 nr;
> +       __u8 pad0[7];
> +       __u32 ret;
> +       __u32 pad1;
> +       union {
> +               struct {
> +                       __u64 gfn;
> +                       __u32 npages;

Should this not also include a vmm_err code to report to the guest? We
need some way for user space to indicate that KVM should write the
vmm_err to the upper 32 bits of exit_info_2.
I don't think we have a snapshot of the GHCB accessible to userspace.

I'm still not quite able to get a good test of this patch series
ready. Making the certificate file accessible to the VMM process has
been unfortunately challenging due to how we manage chroots and VMM
upgrades.
Still, I'm stuck in the VMM implementation of grabbing the file lock
for the certificates and asking myself "how do I tell KVM to write
exit_info_2 =3D (2 << 32) | (exit_info_2 & ((1 << 32)-1) before entering
the guest?"
A __u32 vmm_err field of this struct would nicely make its size 64-bit alig=
ned..

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
