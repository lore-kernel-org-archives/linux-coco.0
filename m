Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F287B6AF94
	for <linux-coco@lists.linux.dev>; Thu, 22 Feb 2024 21:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708636509; cv=none; b=oWmI1Htx9359O5M+nkY6RrdEpJi33VrzKT710j8QFRH1Tm0T9JQo65OLL5PNXMnIE+8WnWeHy6QhSDtzeyWjtOaVZeWWy8UjPT4ZAFQEwbT6wAZjXta6+w7lFVadGtn6mJx0tUXT3ZDNUbjNPgXXxPEbGwAHLg0V5/xO6E0AQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708636509; c=relaxed/simple;
	bh=+xIXD/2/oxIWEfrv3yIZldxrY3+fcQ19267trFYIMr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hp7FO/qskfYpGcY5iuqg9U4kKMqb/0XrWsn6Nie2QpUtkiRImt0kZnUdlXVEqjuO/aoidANOBPG2rOhnPOHJOm6jf+mfn+Yg3eY1lJNmjD0y4ybio2ZNswKMeW4fVSPRmwI/iwusGpjuI9dtoWmQfWfFSIqEndnjVWS4D3t8fkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-59fc31c57easo55764eaf.1
        for <linux-coco@lists.linux.dev>; Thu, 22 Feb 2024 13:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708636507; x=1709241307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwu0gmTsePp7o8N8/VmTdIjFEQ9vkLhfKTZRszY+BUE=;
        b=UAeNzy5LQM/KQ1zWkHJIOoUYYLVpMsH8sKwniZWfIWw8VsZ8qekqQZSoErSObQJPmM
         zr9/vGKt2j3sOzVe2VTlAlzSOK6PklyYpiA9j/r/IDar1TNJh1OfkyU2uR14cSv979m/
         BJnhImnNHVmNdY56Vk8tj9W/TT/LTUC2KRm5v0cAqA87/mmOCF5GUVnXQATEf+c2rkwE
         OEZhYhv7SDiwleJcIp1+aWKXUd0yVUhJGEw2f0ClTY0HjJj9SES2/0f3WFO8BkVqRF88
         VFuVRBBggAAZV8O2EfJNAr1a90mIisGTRtIMFVVZwg2JOiGQiwbXoJRL1klYvTzM01He
         yhJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD1f1mRrU9Znjae3OHn0PYcn5oOaB91xTYMDr3NFtPp6QmotR0vb3Z/bowkoCTNlNctezMOAIeMi4cWLWd20lshA0PevhvPckJaw==
X-Gm-Message-State: AOJu0Yz5Kz4h8tz+CpZmpvZDMvRrq2lv9hOZt76TI/ZeUf42LN8izXFO
	iSyuR/DmLsJfximu5zXYiBqxral7+GRMa4EL9a20K6fFVANv/9CaUKtqH0sADrqfrn0SVtal+Ux
	Jku+baD9/nHDOEr8KhaSqih41I2g=
X-Google-Smtp-Source: AGHT+IFBhFMeTig5AOkgadvukvOfwWjQ8r353Lb0HZrWECBBPfGC+Dj9rZuEDuEVrBus6h6V0upsu6tQaky4nxbghaA=
X-Received: by 2002:a4a:e757:0:b0:5a0:3c8a:4940 with SMTP id
 n23-20020a4ae757000000b005a03c8a4940mr162016oov.1.1708636507038; Thu, 22 Feb
 2024 13:15:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 22 Feb 2024 22:14:55 +0100
Message-ID: <CAJZ5v0hmD+7iSKKexpUccvMUtjNpd9fHo3vRrshD_s=rb5Vq_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
To: Dan Williams <dan.j.williams@intel.com>
Cc: gregkh@linuxfoundation.org, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Marc Herbert <marc.herbert@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-coco@lists.linux.dev, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 9:40=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
>
> It turns out that arch/x86/events/intel/core.c makes use of "empty"
> attributes.
>
>         static struct attribute *empty_attrs;
>
>         __init int intel_pmu_init(void)
>         {
>                 struct attribute **extra_skl_attr =3D &empty_attrs;
>                 struct attribute **extra_attr =3D &empty_attrs;
>                 struct attribute **td_attr    =3D &empty_attrs;
>                 struct attribute **mem_attr   =3D &empty_attrs;
>                 struct attribute **tsx_attr   =3D &empty_attrs;
>                 ...
>
> That breaks the assumption __first_visible() that expects that if
> grp->attrs is set then grp->attrs[0] must also be set and results in
> backtraces like:
>
>     BUG: kernel NULL pointer dereference, address: 00rnel mode
>     #PF: error_code(0x0000) - not-present ] PREEMPT SMP NOPTI
>     CPU: 1 PID: 1 Comm: swapper/IP: 0010:exra_is_visible+0x14/0x20
>      ? exc_page_fault+0x68/0x190
>      internal_create_groups+0x42/0xa0
>      pmu_dev_alloc+0xc0/0xe0
>      perf_event_sysfs_init+0x580000000000 ]---
>     RIP: 0010:exra_is_visible+0x14/0
>
> Check for non-empty attributes array before calling is_visible().
>
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Closes: https://github.com/thesofproject/linux/pull/4799#issuecomment-195=
8537212
> Fixes: 70317fd24b41 ("sysfs: Introduce a mechanism to hide static attribu=
te_groups")

This is not in the mainline, so linux-next I suppose?

> Cc: Marc Herbert <marc.herbert@intel.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  fs/sysfs/group.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index ccb275cdabcb..8c63ba3cfc47 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -33,10 +33,10 @@ static void remove_files(struct kernfs_node *parent,
>
>  static umode_t __first_visible(const struct attribute_group *grp, struct=
 kobject *kobj)
>  {
> -       if (grp->attrs && grp->is_visible)
> +       if (grp->attrs && grp->attrs[0] && grp->is_visible)
>                 return grp->is_visible(kobj, grp->attrs[0], 0);
>
> -       if (grp->bin_attrs && grp->is_bin_visible)
> +       if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
>                 return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
>
>         return 0;
>
