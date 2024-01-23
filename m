Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3B8481DC
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706037003; cv=none; b=Z8O+pxmrx+LrJTBUYY7FehpSVgM9P00miJ74XoYeO2Gdf8MZDPmX+odr/H38Ub6ERb61L0M6rQoLu9EaJTbLDeZd+n7vMabSuYrM466tF03RU8HmtGEUQZaXtYs6LI/mwDdSf0keWBXBEoQdJFZDlOI1myK7pr6oGzT32LGtehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706037003; c=relaxed/simple;
	bh=qnPnYU3UCCouLaq3I4xfQprTzMjKQEyku6K7RAxK7uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0XAGm/x6jcrjW31PUH8gTnQyX9wsijWYlPO05tWYIkQQkVvdckAsun/HIbeCb4mQEZm9F+qyaV5NTOBYJWAd0LI3ln9+GVY977D/dPNHO4mWRDq8a0V/lCuJE5hRniPQSlRN+Vh7ENDVYSYPrnluKaGtJJg4HCESvo0m1wxULo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vUaUXhJM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vUaUXhJM"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55818b7053eso2391a12.0
        for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 11:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706036999; x=1706641799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCHEH5/HbAn23PxxtNB7IHSI9wOxxl+NwqvMevwTt4Y=;
        b=vUaUXhJMjgFUI4nkeVNgvZnXkMx6KV35ta+asWmG0VvffUV9YJaJYa8wx0VVzTS0zr
         EirkAW/HGQU9tZjlex4sKlrEXtgm6S6vDuU295NTAFAHC1NX+VXlVQS7t8w0gFtUZHyq
         6O01+9M6qFWiS9dGfgGCaC/xuEUqKLcEVh+flVNn/AhA4WPWD1hJbZN995GDf0QjUttT
         TpK8Ilq3Po7URnonP5TSipmpO6eLxYbvpSY2g5CyxjI87c+tAJffZDryXBH+wH4tGa9B
         FyC7osNmURIva/JGY1zffY+Bpf2j9tyP6FwvxlsAaGJ0Nk5atgUv/lImgxx1u0PDUTts
         ABcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706036999; x=1706641799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCHEH5/HbAn23PxxtNB7IHSI9wOxxl+NwqvMevwTt4Y=;
        b=M4K8TUV6KHjyjZdIOnl5swU2JvtlVgXL4BFyYlzmQ5tF6B8+cEDF7EhK6PtB0bSbL3
         YeSr6g++MAUQc9MHFgRYqolrpXYLZuXnkWK6yl+5iEPnu4MBWYXS+MyBZdSeWsT3dGbh
         ZNEw7zhspCa7bcvq85NfmSyGwnl6OIMtRDNE1rH+3goCs2opGFWtX5L28Hn8xJoXF/3m
         JsLyXnbBhJLzFl8lHjYxPcrwhwdcsl4ZkcSe2zWpl8AZmXzmT7vFSIuVDkX4bEvhP4HG
         IMmPO1AfKDm63n4sDPqIchToVB+jQFnTrg7b2tjZhXV3a+9henXcKFeAmGI381N00pRq
         fYYQ==
X-Gm-Message-State: AOJu0Yzpc5mP9QPa0IPIqblVFtEHW02hzAUfMUPA+mmiaYBjc/VL/I9Y
	/ucw6gEPcNrfwEMIN+iOshs6qEj5vjioce8l4hxvlj78IwFZGrSWTDLZV73gR6NCeQHZAE7Ut67
	rxpRNHudqNoEj+913FameVzYaCc2X2O70U7kU
X-Google-Smtp-Source: AGHT+IGyHsDKZDRw84SigcKxj+vazyoy83vVM2HM6XtYpkkZw104LKSJRBAxIsTSglb20He/DLk1COCbwOcrO9JZsOc=
X-Received: by 2002:a05:6402:2922:b0:55a:5fe0:87e4 with SMTP id
 ee34-20020a056402292200b0055a5fe087e4mr49878edb.0.1706036999257; Tue, 23 Jan
 2024 11:09:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240123160704.1270147-1-nik.borisov@suse.com>
 <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com> <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
In-Reply-To: <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 23 Jan 2024 11:09:47 -0800
Message-ID: <CAAH4kHbYC4j2Zsz9fBbvUdQzcZxHtQ_H+bR8pS9_QkD0N+3ouA@mail.gmail.com>
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-coco@lists.linux.dev, 
	dave.hansen@linux.intel.com, x86@kernel.org, kirill.shutemov@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 10:24=E2=80=AFAM Nikolay Borisov <nik.borisov@suse.=
com> wrote:
>
>
>
> On 23.01.24 =D0=B3. 19:51 =D1=87., Kuppuswamy Sathyanarayanan wrote:
> >
> > On 1/23/24 8:07 AM, Nikolay Borisov wrote:
> >> When this driver got merged initially there was no widely agreed upon
> >> interface how the quote generation interface will work so having an
> >> ioctl made sense. However, there's now a vendor-neutral interface via
> >> configfs. Just remove the old ioctl interface and leave only the the
> >> configfs one.
> >>
> >> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> >> ---
> >
> > This ABI allows the user to get the raw report which is further used
> > for Quote generation via vsock. AFAIK, some vendors (TDX users) and
> > DCAP user libraries are still using this ABI to support attestation ove=
r
> > vsock model.
> >
> > Don't you think we should wait till there are no users before consideri=
ng
> > removing it?
>
> Given that hw with TDX was just released I'd be surprised if there are
> any users? But then again, this is an RFC so let's get opinions :)
>

There are users in private preview, so non-production testing, but still us=
ers.
Our (Google's) testing environment is already updated to use the new
configfs-tsm interface. I think with the technology being so new, we
ought to remove the old interface sooner rather than later to make the
early adopters the only ones who need to incur penalties for a
volatile interface.

>
> >
> >>
> >> I think it's better to remove the legacy interface now, before there's=
 been a
> >> wide adoption of it, cementing it as an ABI of sorts.
> >>
> >>   drivers/virt/coco/tdx-guest/tdx-guest.c | 75 +----------------------=
--
> >>   1 file changed, 2 insertions(+), 73 deletions(-)
> >>
> >> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/co=
co/tdx-guest/tdx-guest.c
> >> index 1253bf76b570..1642a0f70333 100644
> >> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> >> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
> >> @@ -66,41 +66,6 @@ static DEFINE_MUTEX(quote_lock);
> >>    */
> >>   static u32 getquote_timeout =3D 30;
> >>
> >> -static long tdx_get_report0(struct tdx_report_req __user *req)
> >> -{
> >> -    u8 *reportdata, *tdreport;
> >> -    long ret;
> >> -
> >> -    reportdata =3D kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
> >> -    if (!reportdata)
> >> -            return -ENOMEM;
> >> -
> >> -    tdreport =3D kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
> >> -    if (!tdreport) {
> >> -            ret =3D -ENOMEM;
> >> -            goto out;
> >> -    }
> >> -
> >> -    if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LE=
N)) {
> >> -            ret =3D -EFAULT;
> >> -            goto out;
> >> -    }
> >> -
> >> -    /* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
> >> -    ret =3D tdx_mcall_get_report0(reportdata, tdreport);
> >> -    if (ret)
> >> -            goto out;
> >> -
> >> -    if (copy_to_user(req->tdreport, tdreport, TDX_REPORT_LEN))
> >> -            ret =3D -EFAULT;
> >> -
> >> -out:
> >> -    kfree(reportdata);
> >> -    kfree(tdreport);
> >> -
> >> -    return ret;
> >> -}
> >> -
> >>   static void free_quote_buf(void *buf)
> >>   {
> >>      size_t len =3D PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
> >> @@ -249,29 +214,6 @@ static int tdx_report_new(struct tsm_report *repo=
rt, void *data)
> >>      return ret;
> >>   }
> >>
> >> -static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
> >> -                        unsigned long arg)
> >> -{
> >> -    switch (cmd) {
> >> -    case TDX_CMD_GET_REPORT0:
> >> -            return tdx_get_report0((struct tdx_report_req __user *)ar=
g);
> >> -    default:
> >> -            return -ENOTTY;
> >> -    }
> >> -}
> >> -
> >> -static const struct file_operations tdx_guest_fops =3D {
> >> -    .owner =3D THIS_MODULE,
> >> -    .unlocked_ioctl =3D tdx_guest_ioctl,
> >> -    .llseek =3D no_llseek,
> >> -};
> >> -
> >> -static struct miscdevice tdx_misc_dev =3D {
> >> -    .name =3D KBUILD_MODNAME,
> >> -    .minor =3D MISC_DYNAMIC_MINOR,
> >> -    .fops =3D &tdx_guest_fops,
> >> -};
> >> -
> >>   static const struct x86_cpu_id tdx_guest_ids[] =3D {
> >>      X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
> >>      {}
> >> @@ -290,27 +232,15 @@ static int __init tdx_guest_init(void)
> >>      if (!x86_match_cpu(tdx_guest_ids))
> >>              return -ENODEV;
> >>
> >> -    ret =3D misc_register(&tdx_misc_dev);
> >> -    if (ret)
> >> -            return ret;
> >> -
> >>      quote_data =3D alloc_quote_buf();
> >>      if (!quote_data) {
> >>              pr_err("Failed to allocate Quote buffer\n");
> >> -            ret =3D -ENOMEM;
> >> -            goto free_misc;
> >> +            return -ENOMEM;
> >>      }
> >>
> >>      ret =3D tsm_register(&tdx_tsm_ops, NULL, NULL);
> >>      if (ret)
> >> -            goto free_quote;
> >> -
> >> -    return 0;
> >> -
> >> -free_quote:
> >> -    free_quote_buf(quote_data);
> >> -free_misc:
> >> -    misc_deregister(&tdx_misc_dev);
> >> +            free_quote_buf(quote_data);
> >>
> >>      return ret;
> >>   }
> >> @@ -320,7 +250,6 @@ static void __exit tdx_guest_exit(void)
> >>   {
> >>      tsm_unregister(&tdx_tsm_ops);
> >>      free_quote_buf(quote_data);
> >> -    misc_deregister(&tdx_misc_dev);
> >>   }
> >>   module_exit(tdx_guest_exit);
> >>
> >> --
> >> 2.34.1
> >>
> >>
>


--=20
-Dionna Glaze, PhD (she/her)
