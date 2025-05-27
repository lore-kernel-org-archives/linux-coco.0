Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE927A444
	for <linux-coco@lists.linux.dev>; Tue, 27 May 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360989; cv=none; b=DbLBH9khH2AY77zFoDmqNrSqOxHy3ussxRwUmdvZb2s6zc3f9CoKX1nrA0gBqBfN2nACxPaH11M7wQeXwAxS4FLHVvyalZlSyipy9XuZLbF23jJUWbBMPkmi+sC7f/oY5C+nEdRGsEscHfPfCyMwDovJNZ3/W6ZO5X4guBRbIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360989; c=relaxed/simple;
	bh=yShCBBLRkIFxQZxNmJvNsxRiK/3/0s0yLPvxyo8IwfM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fkOOZ0NHzlPqAtKpJP59iV3QIaUkDRahWBp10quM6N1p8YqgAWRDwbNHNLWiclSl6crQ91/4plGiZqAAdsz0F7R858UCLnGhp72/xLl/ymUa7JfXNzPTzVxIu8BuWL+IAaX2UGp0xIvyVMFpw111iaXi9KZ0Dfb+JlN6oGX4Bgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8FkD9tY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8FkD9tY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748360986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=WZGOJLeYIZIuNyXycDHmcBhHNeauZyZzpVAciy5BvY0=;
	b=P8FkD9tYZFIuEtmDxkdxEsDd82Ao+TxFEDhjNm4/mwJzIm8JAf7QwFgLNlfnselPdecftb
	Wa8HLV2mImKjMCpzKIfx2pXxyIUOxBnc93v+10YIWTf+EwCH2ZLVXgj8YhX99+Or/ACJT3
	RpIGEREQ5fklsSso46I8oJ8EB+G0Fhk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-RGXd_Ao-NuOen_9thTzRFA-1; Tue, 27 May 2025 11:49:45 -0400
X-MC-Unique: RGXd_Ao-NuOen_9thTzRFA-1
X-Mimecast-MFC-AGG-ID: RGXd_Ao-NuOen_9thTzRFA_1748360984
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e620999a5so25780687b3.1
        for <linux-coco@lists.linux.dev>; Tue, 27 May 2025 08:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360984; x=1748965784;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZGOJLeYIZIuNyXycDHmcBhHNeauZyZzpVAciy5BvY0=;
        b=FiPVvjgu5r3RvLF6nimcvjjl1Dxd3s+eTKynfkaITA9ZZzSDQOfFToICIuqNE1nfIA
         gLMDTzaM+ASTcUFI7WasLfYYgsyLnsyROzERzr6Dc3vI5/7kDeDHnBqA3madULdwe9H2
         y9EujIMqQPAwpT9/SWy2MX4LrDOuHWqZnnf1unvCzijOHXAlG0WuFH2M3YM6IPqnlf4H
         9u62CBP5xCP2/MvSMJbOSn+4sj9WtWXFu5Ytd8K9OOKxulxUUYqnAjHrMdkyxbV09/Dd
         fG4Da43Mb6M/No66KdfHBit6kpnwAzHCbRmq0cs+9Pe+c4MNUznZ2JGKmKVva6QNYVWL
         2E1A==
X-Forwarded-Encrypted: i=1; AJvYcCXt1V4TeRZhCU4XG4qfgxgC92MCKOYAfY27wzhGStXPD0w1/lGmDgxmHZtwi9dZRegxczkf3cRMWjBE@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt8/jpwSIJ5gY1xF4v9WQtbwvkYRt3wnXpXANx4CJH0Kr9srn/
	w+yc8fWsIZoJvvFpROkcILI7pmBV9eg3e1Y8LMFz8meF8m+xxXXh7duLiO/FTjEPkcwP2synTAa
	rDvAaVoAFuxLs4ERAGyV/BAt4tM5zLRfnSibBQgFuBTToQUWC2Sz+N9Tm99sT8T0oO4s1tLV74q
	9oLCkoVh2hi7bFKiAuke5T659ovfeUaWtrxQf5+LQUiGF9cw==
X-Gm-Gg: ASbGncsrJZbFOeejmkyh93Sf9ddyBNCrbbRHCCNxygXNmWdpe0IuBhFi9aaZ8O7sgdW
	7xVEuZjF40ufkZ+DkNd89vXcYUOGmhmVw1gsGiWL8ZNpv0nUnLC2tJc4iT9fvKKbjpjM=
X-Received: by 2002:a05:6902:100f:b0:e7d:c9f4:ed7b with SMTP id 3f1490d57ef6-e7dc9f4eedemr3087840276.1.1748360983867;
        Tue, 27 May 2025 08:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiWyvITgJL+J+DThBvUtJX06I5LZ0wJ4xX7cXWNpyrd9yE+oA3SbDhtVDmFlvtI+97dxZWuXgvdd/jvC793zk=
X-Received: by 2002:a05:6902:100f:b0:e7d:c9f4:ed7b with SMTP id
 3f1490d57ef6-e7dc9f4eedemr3087813276.1.1748360983464; Tue, 27 May 2025
 08:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 27 May 2025 17:49:32 +0200
X-Gm-Features: AX0GCFtO07OFGCirVhUW5Z7V4STVi5G09xgnk1wWpqEEzNAmpai1tl4PiZ4ZEqw
Message-ID: <CAGxU2F6wv3QUOD=Ji_Y1aFqpwKUKhcHsUDCdk2uy79DgrvOrrQ@mail.gmail.com>
Subject: SVSM Development Call May 28th, 2025
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bFknIwofy2bnBOdWztjFafZY3QoaeZz6LamOTt3b2Y4_1748360984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the usual call for agenda items for this week's SVSM development call.
Please send us any agenda items you have in mind or raise them in the meeting.

Details of the meeting can be found in our governance repository at:

    https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

    https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Ciao,
Stefano

