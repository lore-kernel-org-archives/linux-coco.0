Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE77239E91
	for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180234; cv=none; b=KFs0cX51+AXSe0cvN7H6RuKmTbx3he0x4M+zc7AtFMsAiP6vg4F1wJHoZWOQE1bPdRIeyUx8Q/Q3nlfyeJpAlJaxq4eEwCijR2jeIoKd0n5ZVjsv2dCTxRTO2iP2ITXpgglOWBnjC+WqkRS9Kf65hfD0tJA7LLO0+Ax8SbkLJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180234; c=relaxed/simple;
	bh=ChJh/7o4qBTZcSBIm+hTx2YGgyQWOtnJzJ9nvD3uRcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=t7Q6OgbooFT/cDZf8NwM/F3YPWYy7ieBZp1Xg6y0Nuw/ro/FPJ7mrnZJK/OzQnzNPJBTmga2EbNiAZpWOVfn2rzO1+N4OhHRm7GhPDvJwLlUvX+aXhtE45Ik7O1eMGsGopcm8JKxYe7ugrnG47Kk6SRymnLub8HP29plHyfUcpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZ3qeP4m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZ3qeP4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753180231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=1PWSG96QyOjE4owvwQsVNEPGnP0IQkpyBAmhWlD7W0g=;
	b=IZ3qeP4mr7UuHZbK0yQHg9uU8DGGLQDuUbRP6MHv8eG6F9OrJi0BCsiEre+bPjEbWjB6gb
	kSbVUekczcklx1vE0a7cyKpniRXIXjWXxVVmudeau4fGUQuy+Iw6L869oqKA4KG4uyXZIn
	w7ll1FsV1bFUHkZbVfysS42ykbiH5sM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-D-Es5aosP9ilTI-WcawYVg-1; Tue, 22 Jul 2025 06:30:30 -0400
X-MC-Unique: D-Es5aosP9ilTI-WcawYVg-1
X-Mimecast-MFC-AGG-ID: D-Es5aosP9ilTI-WcawYVg_1753180229
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e73d3c474so76608857b3.3
        for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 03:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180229; x=1753785029;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PWSG96QyOjE4owvwQsVNEPGnP0IQkpyBAmhWlD7W0g=;
        b=V1lDAW9TY2FtJTuldoIjWL4ohbXy5MptK85sDJd+cGAIgFaI9IJUCK7/oUfYsz7f98
         k+q7amhVOBl2bKLNrFy9tvim+TYgE737QyvLCVFFNAoN/GSopZVxs6OXJxjdQstq9eAO
         wfaGy2IT4D5e0ARD3ad8IvEFGhufGp9e8IO4PqfnTUKPRyXCxFyJxL8HuloS4GOl09X+
         2tXjKup5zwLc0+WtMHI8Q4pf27EqSdgoaow1uiasvd9x/xPnfRbj1M8wX05J0++fowmr
         EqRRGIL2Foq9v7s9HsDarC0Opr39ZDsSUn8YppdkUYDaxVlQ816S6qWf0D93Tq3PXhMH
         DRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0GEw+/wBxwW+M64wnu0qbaey00q9NqPnZlDk3F9UXj4c78jt93Q2ZT8yFAWFmqbYq5PxI7jtSYtFH@lists.linux.dev
X-Gm-Message-State: AOJu0YznHd8sws8gC7DRcl3/rr16ei1EFIojjlR6syl1QnBARwBabIUQ
	TUfwyYHMsSTDjkxPuSwkWcCXSLflWeQyiwgErA+rbOp8cuQXvruEhmCCpv6hG3mPnu7fXka0Qa4
	LRJRnXpgNDVj7rgLiUB2MMH78zQ3cz8yBu9LYygmIWoug8evn2NMP9/XywNlrf1soop2qMoTj0b
	UGIrFTQqjVS+Bb3GtN1JVRypK5ovdTirG9SxSj0g==
X-Gm-Gg: ASbGncsaRkphVCe8zq35+fPuIztBwsXZuTohIX+P4VidlPWkFY/Ls7SFbhJaxI6PoAN
	WV2HTlZq70OifxcDd0dKlVxjZmMIBn1mrMtsDwi4lYlYfiwWuKIxGQWsx91/tccF/DUBySyH3He
	nKfQH26MvtTTHc7Iou6hJK
X-Received: by 2002:a05:690c:4989:b0:719:61b8:ffd2 with SMTP id 00721157ae682-71961b90322mr164461467b3.1.1753180229320;
        Tue, 22 Jul 2025 03:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGISDj5C7QHitDo4ATVH5vRi7lZDrexxwtfIhcGZNLfMb5GhNTevytIb9PPu58RVgHrqfwlfE0i3d5FqcfMq/4=
X-Received: by 2002:a05:690c:4989:b0:719:61b8:ffd2 with SMTP id
 00721157ae682-71961b90322mr164461067b3.1.1753180228718; Tue, 22 Jul 2025
 03:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 22 Jul 2025 12:30:17 +0200
X-Gm-Features: Ac12FXzQ0rxSkYF0t1okQw2sypqfB_27RzOI4fxyBsvNGLGDP4_M5bxDV3Jm9iw
Message-ID: <CAGxU2F4ZVcj6VoXDnjo6ik4Oy=OY1T9Cnw1WYB5oZvzObfEuMg@mail.gmail.com>
Subject: SVSM Development Call July 23rd, 2025
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: Nicolai Stange <nstange@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mF3yRZBm_bkgVizBirc3oBcJXHJdaSRdTVuX1oljjQ0_1753180229
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the usual call for agenda items for this week's SVSM development call.
Please send us any agenda items you have in mind or raise them in the meeting.

There is one item on the list till now:

    * Discussion about persistent storage FS: CocoonFS proposal by
Nicolai Stange


We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

    https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

    https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Ciao,
Stefano

