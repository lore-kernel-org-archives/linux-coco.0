Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D98374CF
	for <linux-coco@lists.linux.dev>; Thu,  9 Nov 2023 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PhZXetOb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-545557de8e6so15739a12.0
        for <linux-coco@lists.linux.dev>; Thu, 09 Nov 2023 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699564640; x=1700169440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIwhQQXWi0AFehKNi7O0UaTyotgDiJs37GZD2S6/JJ0=;
        b=PhZXetObVTKgVuVi7h1c/3z4vk7J0C67toz6FsFIqIxPZjn+L2Rhhhm7qMQN3Y+/jh
         K3uLee365MEmckw0b+ZpJGFVxoEZp28c/HetG1uYfDLLe44aP9e94riVbgE5/m8j+osi
         khRsitENT5STlIqcoxzNIUQZEn37604OtCuJDfGGcIsRlY2DFwUWzlML2FJHphHvoW1p
         UZP8fKN5A3kcnTEmwmh6kBq50ea3nZ/yzKBM+Qj2dCNVo8taqvuEntFgTd6JDkvWmYL5
         otyy3vSbx0IvistG+B+XV9RIqgLBYsdnl4PQFYo29C5ocS3iIQbIbNwgDJQC4LoC6h+x
         PXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699564640; x=1700169440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIwhQQXWi0AFehKNi7O0UaTyotgDiJs37GZD2S6/JJ0=;
        b=O231TwLaMGaNlXKs9dWV6BAGvttwu6YNSG22P2PhwEA68AcxqTwoD6zZ2UJ9ETSyvN
         shTAglesiIviNqv58h2PSV683BMyRNaZ5FHb+COMkxTBsRY4nTG+7weZFNSHPl9NpMBx
         wxTfMlMZsb7e5dDTTpaSw1XH61vKEgSgTnbNSbz2nnw44qBrW9e+yWIvvkN/K3GHwfdf
         tJNSYNjB+GxGj05glFq634rzMGIvGOsJNnewJL52q6yUXFZi/2KMrsH7Vwt/yVpnvYRd
         R2y3YEemMzSwKaV0e9364p+TDex8mMwX6V1fe6xC+0FfTFXpfMecRx1Cp3xa9tXmCBRJ
         1znw==
X-Gm-Message-State: AOJu0YwOdIkaP+DsU0mmr79/bch3zFEiyOMSLlTYEhtVqov3jlRXTC3K
	6ksg9aLZwc26glbz76aGoQ/LNNig1IJQGjhcuDArEszmNHTaQCqfefw=
X-Google-Smtp-Source: AGHT+IE++EgXaPBZdUW5E7nHUqycIMsW8hQpaPgWOEBNmbGkybOLLyfVgwxQwcmSrwkat/hHvWY+5A9iLizdhlHQwEE=
X-Received: by 2002:a05:6402:f0f:b0:542:d737:dc7e with SMTP id
 i15-20020a0564020f0f00b00542d737dc7emr278730eda.0.1699564640057; Thu, 09 Nov
 2023 13:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
 <22966e1b-dd7f-4eb2-ac5d-5988cc6687b6@amd.com> <0743a815-e567-4273-8e13-bf8372c7ee71@linux.intel.com>
In-Reply-To: <0743a815-e567-4273-8e13-bf8372c7ee71@linux.intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 9 Nov 2023 13:17:08 -0800
Message-ID: <CAAH4kHY3rz0N8dWPb6U_UcEP3-X6EhhqLsO8hY3Eg-sPaB42sg@mail.gmail.com>
Subject: Re: RFC: CCC Linux Kernel SIG
To: Dan Middleton <dan.middleton@linux.intel.com>
Cc: Carlos Bilbao <carlos.bilbao@amd.com>, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 1:06=E2=80=AFPM Dan Middleton
<dan.middleton@linux.intel.com> wrote:
>
> On 11/9/23 11:22 AM, Carlos Bilbao wrote:
>
> > On 11/7/23 19:24, Dan Middleton wrote:
> >> <snip>
> >> In addition to video meetings, the community will use an existing
> >> Discord channel for ongoing
> >> communication. No mail list is required at this time.
> >
> > May I ask what Discord channel you're referring to? I'm assuming it's
> > open access.
> >
> https://discord.com/channels/1123803528377413762/1124090655707234334
>
> I believe it is open.

This link does not work for me. "You find yourself in a strange place.
You don't have access to any text channels, or there are none in this
server."


--=20
-Dionna Glaze, PhD (she/her)
