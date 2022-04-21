Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595D7A
	for <linux-coco@lists.linux.dev>; Thu, 21 Apr 2022 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650547222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=X2Y0viypo6ArsoPS4knD0ZkT6H++PkEzt76EP8F4DzAZQgmlgwc/1q9/izZQAIWLn4ASjy
	1tUJts1vLY10QcwDsItl7yXXzb4giDsplGaBa3fTgZu5mo5B37I4cM40FNIhHkE1QaLvYe
	fWs/UJr9X+91t2enKamdA8HNt0efGqg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-hlUo4x6rO66JkBq9x3vENA-1; Thu, 21 Apr 2022 09:20:13 -0400
X-MC-Unique: hlUo4x6rO66JkBq9x3vENA-1
Received: by mail-pg1-f200.google.com with SMTP id n1-20020a654881000000b003a367d46721so2803192pgs.4
        for <linux-coco@lists.linux.dev>; Thu, 21 Apr 2022 06:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=WNmr7Jkbw8+R9GgbGPUCFDywNRS2dYBzUtuqfvZqcMqJxIdlbdELL2Hs8pR73XOkpn
         kEAqkkQ9f3jdyKDNVjXUTNTIsjjbtztXjWGIJJyWvuJ9kbbmOh+Rs4bqXkx4MbvTkHw/
         8LKJ382a1yNQ1kfwD2OFaap4Medt8E9NDa31vSATUEb1BE0wg53nMfELcCrxOl3xlDDe
         jGPjlR+ELnYNsA1s+3MZZ9fwwmqPadUs8BsiqYzGgd2uhxLTiaAMis8bpK7I4kHmAs+l
         pvTASHo9fIpehuZ70dJ9Rm8+foit5u9JEs2yFeVua/Rm0Ec45iomk8SZ6IMeTpZJmbZ8
         Zrjw==
X-Gm-Message-State: AOAM532gjBqtgI3ECspL/Tb6xttb57Ut5laFiVpjULYtMKh1rJspMFx8
	OKsDv6+hk9OGGyfzwKQUkrQLybM/yioRJbdMmUQusRhVL0VZNIJ0hPOUpj7YQ/uYyAxgcMAUfxv
	eWfMhXHall7g14QW1R3Isvg==
X-Received: by 2002:a05:6a00:ccf:b0:50a:db82:4ae5 with SMTP id b15-20020a056a000ccf00b0050adb824ae5mr3581856pfv.59.1650547212328;
        Thu, 21 Apr 2022 06:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEg/XKr6Ui9gwh2MQYBfHjjkLlJhmxTVmRmjaeYiITKwKssa5krUtFdDxn4eFPTWFfCNVNig==
X-Received: by 2002:a05:6a00:ccf:b0:50a:db82:4ae5 with SMTP id b15-20020a056a000ccf00b0050adb824ae5mr3581819pfv.59.1650547211962;
        Thu, 21 Apr 2022 06:20:11 -0700 (PDT)
Received: from localhost.localdomain ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id lw3-20020a17090b180300b001cd4989fecesm2984649pjb.26.2022.04.21.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 06:20:11 -0700 (PDT)
Date: Thu, 21 Apr 2022 21:20:00 +0800
From: Tao Liu <ltao@redhat.com>
To: joro@8bytes.org
Cc: cfir@google.com, dan.j.williams@intel.com, dave.hansen@linux.intel.com,
	ebiederm@xmission.com, erdemaktas@google.com, hpa@zytor.com,
	jgross@suse.com, jroedel@suse.de, jslaby@suse.cz,
	keescook@chromium.org, kexec@lists.infradead.org,
	kvm@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, luto@kernel.org,
	martin.b.radev@gmail.com, mhiramat@kernel.org, mstunes@vmware.com,
	nivedita@alum.mit.edu, peterz@infradead.org, rientjes@google.com,
	seanjc@google.com, stable@vger.kernel.org, thomas.lendacky@amd.com,
	virtualization@lists.linux-foundation.org, x86@kernel.org
Subject: Re: [PATCH 01/12] kexec: Allow architecture code to opt-out at
 runtime
Message-ID: <YmFaAFcQPhSWNEFz@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210721142015.1401-2-joro@8bytes.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ltao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


