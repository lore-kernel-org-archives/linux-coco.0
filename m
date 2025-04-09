Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708DD211472
	for <linux-coco@lists.linux.dev>; Wed,  9 Apr 2025 23:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241854; cv=none; b=RjwDZWu1LnF6K8/cyvqO4muZgMZSC0YVPTTkmErOYEWO10qW9Gcmna1LBz+qxCmnR+FQGgZ3hAofkm2Ys3sKqXOz82BeSXlvgPpZF5Yu9XNKFQyV/0kkEDmlb/mwBaGIFW8FbOcyvK+0/5GKvEVqaCFgTF4XjPL837oYrLGuS6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241854; c=relaxed/simple;
	bh=UmlKVGhfaAvu5aoD+dUFD7Xg7HpkZ9pXE/J8RphzVFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=cbw5LsrXPscf3s5JxKjlET/WrXM8PqdQX+XUrSGRLgrH9MMzIp73x0vEqVeViXW67bHwBcu35chdgBnD1oxiabeSnJ3ssVWx3KwvRdIfR6/0vQa3v/CuO67uIIspUYvUrgERWr6Au4mb2VS0ylCHeCPpLJkz99/IOKg7xn/odIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0g/zlPhp; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0g/zlPhp"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-873ac8037ecso69988241.3
        for <linux-coco@lists.linux.dev>; Wed, 09 Apr 2025 16:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744241852; x=1744846652; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmlKVGhfaAvu5aoD+dUFD7Xg7HpkZ9pXE/J8RphzVFU=;
        b=0g/zlPhpunHR+3gl0mmtNGwAVTHVBB5+sXKWWe2nFn4LpT4dAZIToMsksyZA+k8uO2
         PGiFG4083kX3eXI5oL33qzS8xuzMO4SVnWERTUGy8qD6PAsaD3pGhxwmHmul12N7xvTa
         M/LzMWcgaJWE2MNnbrLyVIlHgusY0TIpnx3TNb9F4pvoLprsABzEwC6tl49XBvgdf16z
         NGK6ySK0TASq6bgk6voPt6EqwbwWuh17m5gbUbxnDX/c21+UCFsh1/CbOJD2mqXfSaVf
         Ke50xx02bewTpPcQdeCy7cTkZ5VFIajJChYZB2tMr849JQfENRP6zWVN9GT4TlzCHzc6
         nQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744241852; x=1744846652;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmlKVGhfaAvu5aoD+dUFD7Xg7HpkZ9pXE/J8RphzVFU=;
        b=T1anlP16bqbjXXgYcAlXtT6IDuCe7gPmu6uWOCdXvE31kC5o3poEXnfOjmsc5jeUkX
         9oClZt1MzxjCl2dNQBJyrEFYhktpugLdIWBJS3+KEpSr2u6mBIcHxzWnWxxw8N8XzYlM
         Az2HD6lBhAqGkOmpoi/SjBD4u7FBrBOxmPIRGkp4dg44yvCRxZiIWQ1aKe6QDeitkDxH
         NloPwFNUxwSV/cl0Jr8dlU0APZ26N+sSsSwKsOkDQp2SX1QCnCFPpj586r68sWe1yJNZ
         oM100bFiQkGELvq5hc8WfudkC6cAslOXqg8odMMxXbs4qTRT+jldsRXkldXuq4DhcyPF
         Gaeg==
X-Gm-Message-State: AOJu0YxZOqbADi/iB/gNKUE67Sr4VyZBBiNXtDbcomACQNUn8ZpN/LWJ
	dAzqL/RYniLiMwJtFk50QRlASuoeXgS974rPOrnQSqjUpWESJyYgBKTZP6jUUKW3V8nwHKaK8Wp
	49bR5bEp3wbYasfTPqbFfn09tQswbHQOq+GOY6/kqiPxaHo0dI3Vv
X-Gm-Gg: ASbGncv1jxeZBdtpCtlO1Nn7ITsj5NUpv8Z/1ZM/gkH9RtbNXCBtB6jjCdvZwJVnjGU
	iWUrGri6O/09G6bk4+cHzXju2tTFEfgjq8jQoB3Jc3B6nfyCA6zqnTqOfx3IpSf2r7ShsOLO1Gk
	wy9sExsF32m4aVOpBysC8NJkvgNoU2R1OtqU9zNI6E3hTtKvG4i35j
X-Google-Smtp-Source: AGHT+IERv/hDOaZXQ6weWc7mYhxDWISCVbvrRoRj3nF8vkgtrbnqcquWxI+5H7Tpj3b4MgveChQceAzZaRId8KVIeuE=
X-Received: by 2002:a05:6102:149c:b0:4bb:e2a1:183e with SMTP id
 ada2fe7eead31-4c9d36adaa5mr745289137.18.1744241851570; Wed, 09 Apr 2025
 16:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABayD+c7G2=3ysYWFLziFM7SEd3KLDzVbQNjUtk43rdeRrf8qw@mail.gmail.com>
In-Reply-To: <CABayD+c7G2=3ysYWFLziFM7SEd3KLDzVbQNjUtk43rdeRrf8qw@mail.gmail.com>
From: Steve Rutherford <srutherford@google.com>
Date: Wed, 9 Apr 2025 16:36:55 -0700
X-Gm-Features: ATxdqUGSoYcKOLlpKgeZ0WTFBFK_tJaqc-hiB2Nsvhvqk4C_0VyRG5MRxxZFm7A
Message-ID: <CABayD+dt05zKQGuAbVNZvnzVWE+GTRh2LgtccrPpu8=_of6ywg@mail.gmail.com>
Subject: Re: Kernel SIG meeting 4/10 - Open Agenda
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Cancelling this due to the lack of agenda. Sorry if you made plans to atten=
d.

Thanks,
Steve

On Mon, Apr 7, 2025 at 5:38=E2=80=AFPM Steve Rutherford <srutherford@google=
.com> wrote:
>
> Hi all,
>
> We have an instance of the Kernel SIG coming up, at 9AM PDT on
> Thursday, April 10th (6PM CEST).
>
> We currently have an open agenda, please make suggestions for topics.
> In particular, if you have any topics that have been challenging to
> resolve on list, this may be a good forum to hash things out.
>
> Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/9240116=
9243?password=3De6c02995-6cfb-4f90-82b6-747f767eb168
> Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoo=
zcekDzvIlK2_bd4/edit?tab=3Dt.0
> Calendar - https://confidentialcomputing.io/get-involved/calendar/
>
> Thanks,
> Steve
