Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACFB34B667
	for <linux-coco@lists.linux.dev>; Fri, 31 Oct 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921123; cv=none; b=Y0O24HnFluAaE+l6IAV6xpQe4VBFFGxPlUu+PFHT34A3yOI0HUof6o/bZED8bEA8lu3eZsDLzS2pvkKWxDOZ7DjEhTW8EcBACPh5lt/PLVAj3oK3rLfUe4qjIdUUWDzQA5/P4myz7kOKjXD6KIdbRGiu3YncrGKM3uDOJSncJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921123; c=relaxed/simple;
	bh=ztfuXoIA/8/IzjLvWd47nqIEIo1a/dLhajOHezVjkdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ln2mLAMH5ba1FgdvE4PUstoRumVUx4f+MXDuGTPPuNfmw1BZbEzEPpo6igRLDL0FYK1SspVANdZT2epXDD5eX5zBlNvlkMEmRSlKYrSC3mKkvF9qB1XmLHcnkF4uzHrrQz4WYMfpHHebOvZ0joTzryDb4iERPdL9oJUI7DFgCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wFXZeqjr; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wFXZeqjr"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ea12242d2eso378871cf.1
        for <linux-coco@lists.linux.dev>; Fri, 31 Oct 2025 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761921120; x=1762525920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G95L3DLvS/DNATNYDSMXETdETrIxVgxQLONU1k6QAU4=;
        b=wFXZeqjrX6GVB5MDsJHPJh8M1h42qHWiooWE3sJttKs00dWQdHQCI8Jga6sZNidVXZ
         JQ36kczYV2tiLVWccuQDp4LPjvPgUxhbZOQnQl/g7gBaCJ1YHWWPbSq4aD4HyTpL0YAN
         GylJUKH9m8AOQz+esPF9sgQatpev8pdwcc7xOuboin9wIVUx86eaIJt4o69iT8R9yd25
         YROmJpx1upUWb5kmXC64MtpRkRYaZSqguU2hSLuqnbY53uEhgpeVUdzilXM6zyxxgAYP
         NHFDz55TLRCj/T3GgdhE3AWxr7ogIVELcDOrBtVA1lLLcwau/TDvgJ/0IIQl4y51uqeQ
         O45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921120; x=1762525920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G95L3DLvS/DNATNYDSMXETdETrIxVgxQLONU1k6QAU4=;
        b=h0G/KZi1/og1Bh+UVArXSBI1fmcmqLD8vb75VDFt1u98OXwm1qAKAc1FWr7PGQ0NzQ
         qdxmjdjbBFCX/h9tJdNCoBFUCGVyZK94wr16PqWnGWiUXOG1z9nKQSNBQd2UNHVqr5eU
         aUveSQUMuWlgAD0OIh41TFG657T1bxmMAKtBMcJESlS0ZQR7nHVE71GNOn45BSgjxGci
         b2/A/0CYVHmA1YF52a1+ygPqK20eUG58c3+tE5sq6IAwwWZAqi92WJpr17Rd3SprWeCq
         5J7BJHMuF9Wirr/SKm9Bw9QgprYw83Khk5QemIpdkvErdiH8z7ExiNzsqCdHf1aQsj7N
         gRMw==
X-Forwarded-Encrypted: i=1; AJvYcCW5UWeyahBc8s0wbUJS6iOiCKXftwtulA8fRAH2sjBo0KjYkN+RSi2pDMkYIvWmEila3qRe5znPe38Y@lists.linux.dev
X-Gm-Message-State: AOJu0YxfdJQ2QAVUcdhupuVmvAZh2AIUQDrBnyS/48bzJSM6/Ze3w4tu
	Csfb31noAUOyhuvQEXd+V3fqMFG7RS3TR7UEtajcSsNqjIS61G82x+gU8JVvfI/lKsAvDC6X27u
	Ci0Gkd+gs4kCH1FBaNnEIbIaFFJwTUd2Rl3Lw1+v3
X-Gm-Gg: ASbGncuinH+9oiWAfJIEuOtnCYwJ2KzWaK0KN9OWNv72HX/efbz9ZIqZQmABsYcxXik
	2lwk2ycROAZt/ved9PjFS/TjmAh6XyA2zp8ClWf1C6kI1QQBoioNWboyiEMqWpjYWNtspEHreoG
	1QIdACgOq95zpj2mpfpc7XCx26HLy3Qwm17D1mH1UdViyfDwW1ekylJsgWMFGdPgvQb93Ss2c8d
	+OLIFH7N5rHh9OzmApv6STCMttGnlRXG00H8Vyckfa9qvPAtJaf7oWhQVmzadvEjxB4CG6kys3W
	9V/cYRLNTZnxe6NDwJ9Z6Q+raEw=
X-Google-Smtp-Source: AGHT+IF/Qso4SJD1J9Awit7eARmSYManprQ6V5RDK+znSyKxcoLwTsKzFBHsprkHmdeX77HTkMxjecZ+rWe1vvB8RLY=
X-Received: by 2002:a05:622a:1817:b0:4b4:9590:e091 with SMTP id
 d75a77b69052e-4ed3385bca2mr5839331cf.5.1761921120002; Fri, 31 Oct 2025
 07:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <20251001025442.427697-8-chao.gao@intel.com>
 <CAAhR5DEQw9eMVJ_mWRP3G=XqmsR4_46xh030_Vtyx3HzWXn3wA@mail.gmail.com> <6903ef44cbf81_10e9100f4@dwillia2-mobl4.notmuch>
In-Reply-To: <6903ef44cbf81_10e9100f4@dwillia2-mobl4.notmuch>
From: Sagi Shahar <sagis@google.com>
Date: Fri, 31 Oct 2025 09:31:49 -0500
X-Gm-Features: AWmQ_bmbnxKmBqKoD8vD9Ui7lZxDASP_7X1rDLL5Fan3JEh-qcGYvqIWKACARo8
Message-ID: <CAAhR5DGvDoCd_OZURF604LO0JOHoFjWM8Btk8uS_jzJVfk5J2w@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] coco/tdx-host: Expose P-SEAMLDR information via sysfs
To: dan.j.williams@intel.com
Cc: Chao Gao <chao.gao@intel.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com, 
	ira.weiny@intel.com, kai.huang@intel.com, yilun.xu@linux.intel.com, 
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com, 
	Farrah Chen <farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 6:05=E2=80=AFPM <dan.j.williams@intel.com> wrote:
>
> Sagi Shahar wrote:
> > On Tue, Sep 30, 2025 at 9:55=E2=80=AFPM Chao Gao <chao.gao@intel.com> w=
rote:
> > >
> > > TDX Module updates require userspace to select the appropriate module
> > > to load. Expose necessary information to facilitate this decision. Tw=
o
> > > values are needed:
> > >
> > > - P-SEAMLDR version: for compatibility checks between TDX Module and
> > >                      P-SEAMLDR
> > > - num_remaining_updates: indicates how many updates can be performed
> > >
> > > Expose them as tdx-host device attributes.
> > >
> > > Note that P-SEAMLDR sysfs nodes are hidden when INTEL_TDX_MODULE_UPDA=
TE
> > > isn't enabled or when P-SEAMLDR isn't loaded by BIOS, both of which
> > > cause seamldr_get_info() to return NULL.
> > >
> > > Signed-off-by: Chao Gao <chao.gao@intel.com>
> > > Tested-by: Farrah Chen <farrah.chen@intel.com>
> > > ---
> > >  .../ABI/testing/sysfs-devices-faux-tdx-host   | 25 ++++++++
> > >  drivers/virt/coco/tdx-host/tdx-host.c         | 63 +++++++++++++++++=
+-
> > >  2 files changed, 87 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/=
Documentation/ABI/testing/sysfs-devices-faux-tdx-host
> >
> > Trying to apply this patch locally fails because
> > sysfs-devices-faux-tdx-host does not exist. There are also conflicts
> > around drivers/virt/coco/tdx-host/tdx-host.c.
> >
> > I'm looking at the base commit specified in the cover letter [1] but
> > even the current head of the tsm/tdx tree [2] doesn't have the
> > sysfs-devices-faux-tdx-host file. Are there any other dependencies for
> > this series?
>
> I hit the same head scratcher, but then realized that Chao did say that
> you also need to apply:
>
> https://lore.kernel.org/linux-coco/20251001022309.277238-1-chao.gao@intel=
.com
>
> ...so:
>
> git checkout -b $branch 9332e088937f
> b4 shazam 20251001022309.277238-1-chao.gao@intel.com
> b4 shazam 20251001025442.427697-1-chao.gao@intel.com
>
> ...works for me.

Thanks, I missed that one. It's working now
