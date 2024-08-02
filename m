Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BB16BE0C
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722619265; cv=none; b=B1f4ZuMDrrLHCE2be0ryE2WIyPAvhCwebXuW4vLPMXTgRnEgWP78jXtpL09V3MuC8e3+j+Hru6Uwwsocu/L/0IfJ2oorNF4JcGHpIx/yaG//1/T38pQ9YI/ptTPMHFoCqzHs808gW9Ft6q21DkAbh3/u3Kw8I5KAA9xmvmUVLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722619265; c=relaxed/simple;
	bh=mvPmAJxOCoc3DrlmBzGfaUMFIP6BB3aCZfBH8RkIYyo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=S/DxKms+uRzCkoPiznlfWXWLpLZGac41TsihR2Bi68lWkVUZYknOUgyfp5ET0LNeh17l3OYFp1FoIuJQCZRc9PvtoJ1TXmiu4enV7uk3mRmWEcdPk7ZzDcYSLP+hbHD4HThb7zyon6ZptqAX+EyRlkoubtjhGNEv3IaX2f4q7Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLU7NFtJ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLU7NFtJ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45029af1408so943881cf.1
        for <linux-coco@lists.linux.dev>; Fri, 02 Aug 2024 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722619261; x=1723224061; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wZmgLef/zUEfwhReuJuug+b2TEQamoZ+vRu0K2Q3aJs=;
        b=SLU7NFtJAeUTJNOqf+Ve943jwo9HXAc/KPcmVO6y2hCX74BfJTb4+cf2/B9PEZIIks
         62geOv+eDL764jsI4IQB+G6MjqU/NlgnOTtk3i/6xdFqAQBGlmDr9VjIV1WyfShHz6F/
         BzQwLDTlBN06zBS/fnK9Tyg+PB0oAFkmQTxjoH4VtMwevSFH+RVfmlrwPXbT26sYzr0U
         Sa58o4x+0uC9qCXe3q8084vI8LkXYht8QAc4OpwKaEZumZ630kaVMUNYJJKkCo9utfmU
         ALbAZLBQvcDAz7fmowP24mnRQiwf8NXo/MxH6Ioy0dmdOma5YSUygifVntNZomgtNA3l
         si+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722619261; x=1723224061;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wZmgLef/zUEfwhReuJuug+b2TEQamoZ+vRu0K2Q3aJs=;
        b=vHaB3A1zi/a64kLh5d7zPn5mMysmNwOOY53MD65jPhmPCc9koXpNn4FKOgOK04LdBA
         tzQIgSfMLfyXVMk9ukw1Rwpc9oMgG9doy4jpoha4SRkUBRfW1hcZi7U8oF9+LiGFsT2C
         8rxySixIUfexq9486LyA2ld4BygEQy7zNSYTelGafNqgtK3WbZ3m9WEnzrFqwQ208KfK
         7hEPeDy3CG3wzt4i/IG4NhfxJ5nDsypenK3xnIkzsOw9VUgPFGpwOrV9BBoW6pikGXkX
         rIJcxYSvnjU4o9OzZzSxVRn0yZ7dp7YyZre8tVoocXGKQbGtyVffNAW6O3LPUxM0zZLb
         uwOg==
X-Gm-Message-State: AOJu0YzBWL4UTM6SiojzYf807C/9urousnYGLVveFKEd4tDvYT3ndRm6
	+HuS8AdiKNZqN6CC14ycDugW2h9hrrkk9BxZSMNxI8KXPNVVoJsh70muRbLwmE9Y8HVFFFoY3pv
	R323SvdILIowidYBzHFsohAzmE20HFXJXF+cc5s9jYX1AjuuTzNrN
X-Google-Smtp-Source: AGHT+IGlTJ32KyOspUTkLvv29bi34mtkuHJJ+juCNqNYRYVszFKECVA1nYmlRmAJPGkyfdsTDG3N2Z81UUKE9PYojWg=
X-Received: by 2002:a05:622a:1791:b0:447:d78b:fdf6 with SMTP id
 d75a77b69052e-45198cda14amr1961cf.10.1722619261030; Fri, 02 Aug 2024 10:21:01
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Fri, 2 Aug 2024 10:20:23 -0700
Message-ID: <CABayD+cxw+x77urjEYn1y_mi9DNuBreNNAuApGdYu_s6767NEA@mail.gmail.com>
Subject: KernelSIG/Devsec Call for August 1st
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

KernelSIG call just finished up (apologies for not sending out a reminder).

Main topics for today were:
* Hotloading of TCB components
* Pending Patch Series
  * Private Memory Discard Manager
  * Device Attestation ABI/Device authentication policy

Minutes/agenda for the call:
https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit#heading=h.ga3eq6oielwo

If you want to bring something up for the next call, which will be
EU-friendly, feel free to add it to the next meeting in the minutes.
Or feel free to bring it up in the call itself.
