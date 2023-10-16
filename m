Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD8F2AB23
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNhVTyQN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5079fe57721so6306e87.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697470936; x=1698075736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu5BfpoD0rf58AJyVvt9WR46RCb0rc8jvPm928IV7T8=;
        b=WNhVTyQNi90VcHxojOE9/ah77KCkEXel6sZVOpc3df3tgMCXUje8DFq2Ge17rI8ZH3
         CqjHGUHMpmKatLsnuR7/VCXMVIs3A2VIyeqVogmSFBO/OB6+KKwK3P4Poow29YNxi5jS
         Bik5R5rrTIAiarlNdQJV5+WxozXw2Z2/4yRnZ5gGccYzW1esUgrJ6djwBZ2NdVRPA3qJ
         9QESaq7H0QMSjdLFAZ+/fLDCivabd7JzgbWYpym1qQC2vpGQ7pU9c9ZRB35f2YleUFtp
         SGepftdeVIlI0J4XVbSdnvKzK2AoGbPfA4CJw+yJWPeSMDEmQaKCZkt7a0uqxdw2WiCu
         rmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470936; x=1698075736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lu5BfpoD0rf58AJyVvt9WR46RCb0rc8jvPm928IV7T8=;
        b=oGpob/SYz8qLhhO0E333SvphhCv08UjAkcwxK+7Y9pF7nIf6njH7PQZGk/nkgWHXiv
         KlgVLDT8RqUy6RTUOd5FN6GQCtw0AkNCjGN2PYfmfM0xvN6FcZmzkSLafEVKONLTfS4/
         RjnGCX+rC/VGE5clGwo3ZaabYbsj+zd1q9HtdipdqRpK7Ho56WNBk23WNBRdCOZlMTDv
         MpKJ1iKfXy8rkSC/VIFYIYfulnls8wTijj5SqlituWJRZuUtX97knVT3nFp/whsAuZ2w
         9dMG7kGzLvD+kkvJTEwv+uwsMMJEtSITt0Y4D/FpFmjlP32ZqJ60n0qx0bVpXCZ1EawU
         XlYQ==
X-Gm-Message-State: AOJu0YzlFNC0J5a9b/7EiUZNaKMwI0s6FCwNKc18JRvqY/viM/RikjKQ
	OSokMxLtqBYNoUOJ5ZWJ/v0hVMpVCc1d+4jtmaQzNQ==
X-Google-Smtp-Source: AGHT+IFpIhOIFr43LLqCP/27HhCG5lv3ENv1SE3apz5K/1ZpvZNaYuspV7cjXOpWsKAICJhXQhZA/MaLa2uXNgPOitQ=
X-Received: by 2002:ac2:5f52:0:b0:505:6c73:ed08 with SMTP id
 18-20020ac25f52000000b005056c73ed08mr123950lfz.3.1697470936452; Mon, 16 Oct
 2023 08:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com> <CAAH4kHY_R5-fCo_=n4=k+kE99EVT8m1tcOytK2MUessynE7X7w@mail.gmail.com>
In-Reply-To: <CAAH4kHY_R5-fCo_=n4=k+kE99EVT8m1tcOytK2MUessynE7X7w@mail.gmail.com>
From: Peter Gonda <pgonda@google.com>
Date: Mon, 16 Oct 2023 09:42:05 -0600
Message-ID: <CAMkAt6p_mTKrzzQGqzMPB9FU9Nqy9yLJ_tCqFQQ7Q_W12XCkJg@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, peterz@infradead.org, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 9:39=E2=80=AFAM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> > > +
> > > +     struct snp_guest_request_ioctl input =3D {
> > > +             .msg_version =3D 1,
> > > +             .req_data =3D (__u64)&ext_req,
> > > +             .resp_data =3D (__u64)buf,
> > > +             .exitinfo2 =3D 0xff,
> >
> > Not sure we need this line with 0xff.
> >
>
> The exitinfo2 value had an uninitialized memory bug, where random data
> would get returned to user space. I think this is carrying forward the
> initial value that sev-guest currently uses.

I think during the initial review I asked for exitinfo2 to be set to
some known value initially. That way userspace can tell if the request
failed before the ASP was involved.
>
> --
> -Dionna Glaze, PhD (she/her)
>
