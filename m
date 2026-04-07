Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858713A4517
	for <linux-coco@lists.linux.dev>; Tue,  7 Apr 2026 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579799; cv=none; b=KiJtk2hDzbK3pH7u56DWE7cBXxDorqhKfqc+APAp0nMuTXleD6ISbMho+UnZ9Jyng7XMYEvCmgAtbtCdMqHBxb/p7o74R1rkI48LAvgLTBzYmgpM6ewUMRWLZiwHZfvXC4r/p1q12hskiVUk0SRTu2sz5OmCW9QSikdDQNcfYE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579799; c=relaxed/simple;
	bh=ZsZWGK8NPQVAaVImU3h0Z3K3DNLW37epYpfvEpL7kmI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OCB9oeh1OU3TdbXLdsqQni4IBrzc3HxsDpOSgSLACr8ceZ76YVvh/q64NsB0x5vc1yCwisFhZYbOITqNVny//Md6VuQI/uniqg9fj4/aConjnUD/r+urZSx4+5k45zL2TGSstD71Pu8x6qqjuHNLEvFLEaJfDVILu7gLD7Eobug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5MCBVjR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5MCBVjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775579796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=LJCTQ6yvzucVb7LSRfCEx4d2sHWJ53AMLsBBh6zk0Fo=;
	b=H5MCBVjR25lE28jUnhFyKsHiOP/jGTvRgT57rt5KZW3VP39oSZb0Z2Ubi2cjtm4Rduupbp
	gP6U7jGMtZ9EL9yp9lbIC/QRmmo3J+5qSh1I5Vo8OqYR3K09Mty+k0+tEAfXodC2nUc3Gt
	ZpbjTahDovADZmrKK3GF4rakTo0Ho4c=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-Nk2qDMVUObWpZfMn8N0S4A-1; Tue, 07 Apr 2026 12:36:35 -0400
X-MC-Unique: Nk2qDMVUObWpZfMn8N0S4A-1
X-Mimecast-MFC-AGG-ID: Nk2qDMVUObWpZfMn8N0S4A_1775579795
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so5230357a91.1
        for <linux-coco@lists.linux.dev>; Tue, 07 Apr 2026 09:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579794; x=1776184594;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJCTQ6yvzucVb7LSRfCEx4d2sHWJ53AMLsBBh6zk0Fo=;
        b=XSdG1ucb93uXDA02GGZqrCm1Qmm61Rb0viD4NzbouCJfDVxnzr8xw5IgR7H7uBmHR1
         qj4OHVVrO5RNYVLJvlpce8J/VStENYjQ+gqMxqbGPGOkP1tHAd/ex1+zUEbfjVnFM8eo
         y9nSPubdbq4CmrJfuSz/qkGYd4wViGwQ2Z3CWcbiRqZoji/eiCsbdNAuEvE1vIsZCUor
         XGGp+jfm5O+Sz4eZZa6ZxuyrZwAmmit9KYwnqZSL7erAIfaGxrl4+KjrKjlLfqGDp9V+
         pJQaJch2OJaeLjc+3ijfNrAOZH52kPvhpK/rMDMfIwoFAnxuOmjCuRHGUv3hL+N1mgRa
         9+vw==
X-Forwarded-Encrypted: i=1; AJvYcCXX2nOYnPmt3fElrZEKUDJ+XXwCbCs+dZhaMe4p1IGkewIvk48RdH+KdoSOFFp8EZOUY9hb0Kj7wT7c@lists.linux.dev
X-Gm-Message-State: AOJu0YwkFk4QzT1L7rHbZHhzow6oUgscqqSpph4Pkr89LUxLVZC60S3c
	wnqyLxWO/n11VMgfPjYSOFmG7lLHZWmiIKL7KV1E1Rqu8Cg5TPz+PhcVJUKAOp7XUOlXR95Z6m6
	dWedYM3lqzUBqzMLLGmp/OkX4d/kAHU5dyU9Kr00MDF1u7q4U3hLzpvAJaAfgDBikLpG05mSuRm
	riYJCRzJT2iom8YYiMaqPDkq4H24dwoIIxaxrK7OOLvMFtiljZ
X-Gm-Gg: AeBDieufZQ5Yz3KRPZPoVDBhM62Abm5CAXZAuyndDJWUu7fVhBBTttIH8nSaksALPki
	PlypeBh+fmJWuHpgo6tCUFEn2cDXsFbVryCuEiiykEoNvblfrcNULH9/ohYt1/Q2oRGf/pCs5h9
	51MWBscgg180aaDgErQT6kFcLdWLu71RzpcgX92oAweAKA2RyeprJk/7GEr2aOqduNQKDnB6IYr
	pwR
X-Received: by 2002:a17:90b:2e0d:b0:35d:982d:96c7 with SMTP id 98e67ed59e1d1-35de6980b71mr18628843a91.27.1775579793971;
        Tue, 07 Apr 2026 09:36:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0d:b0:35d:982d:96c7 with SMTP id
 98e67ed59e1d1-35de6980b71mr18628800a91.27.1775579793278; Tue, 07 Apr 2026
 09:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 7 Apr 2026 18:36:22 +0200
X-Gm-Features: AQROBzDB-aEaoPKvHT8F596oTqnKgNiJsmIBcp2TBkUe2U9M5Fm9UyxZ_pqFgDQ
Message-ID: <CAGxU2F6OApB3K61_sPujnvK_gx_K8zFWyOSTPV9mzWOCyNkBJg@mail.gmail.com>
Subject: SVSM Development Call April 8th, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N8LTqB8MD1DYxfstEey1aNM5Bj1hBM-f1bI-PqV0W1M_1775579795
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this week's SVSM development
call. Please send any agenda items you have in mind as a reply to this
email or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,
Stefano

