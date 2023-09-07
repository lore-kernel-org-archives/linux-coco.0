Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0C28E7
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 16:10:23 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6c0bbbbad81so310204a34.3
        for <linux-coco@lists.linux.dev>; Thu, 07 Sep 2023 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1694103022; x=1694707822; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SgLgd1SPc6YB6mb40hQjfa5ZZlpVScz+27QCEpD3rcU=;
        b=hBVvB72sATgJasOWaikiVSEXm0BdMcJ8hM6GQIpNTvealwCr+oZtTWs3gmTOnOflVJ
         O4lvYqvEgA9+n9nJyfRKITEcXM26KLVSYj1LNMK+AmUN5+fAvxhKZu13b1e0zikdp+9U
         qSrb4vJWcR8MhupF+eP6ALipTfZPci2br8Mvy1LmFzGSUNttNl4pmVd4jRpCVqKsVfAs
         tmi2/3ZJuvu+Xo4uXwGZ412zeQfxLLls81+GzCeskGFXUb8BwWeg7yZYr9ADEy/pAEMN
         E57sH3qOR0/VebjICS6Yz7GppuSljfmjR2WTB3Rz01fpaBUxw/4vqRS/nfw1TpcsaojC
         INkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103022; x=1694707822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgLgd1SPc6YB6mb40hQjfa5ZZlpVScz+27QCEpD3rcU=;
        b=AslcO2Q298a9y8ruv8+NkCbRlUnMwmOstBMKmkU8suB4u2D88ZoE5FfNaUxmXWB+zy
         7poQR3fUhgoXPr7QSWoX2fLMZVYlVxLi3cD3WVAZCVmvCeNxdCcaAGw34/ycpeR8dTmX
         kLC2WoQEtMltUsuLvQlKeMBrMkGTs6CIHKSiSB0w57qgSwnxMRORYm5jbnYoT/mAwLfl
         s+JtUAQNvqBIuF3uMjSVcM+huaPZFxA3W3j/U+z9S2DflUtfXisIA5VyHiUfq7pG0Bo6
         SBVuafhAM95qI/B255cHFpKHfPH10R2ow2yciUPqfP1HC7iVS+zBc3s9bftSU7UOOzc5
         lfpg==
X-Gm-Message-State: AOJu0Yw5ivIb11NQbSh3YTF9sZi/YEAlMu1Ed5+KLI7dxNRaHp1XzGZd
	hidX3mosds1dgMU8EJ5jH8liAw==
X-Google-Smtp-Source: AGHT+IERsBNl+Au3IHrRw2kUYGqmyQ32p3bRKRylRe/SD4Zg8jGBdBHeqpIHcghYXGcvloCt2IKYGg==
X-Received: by 2002:a05:6358:52c8:b0:134:e964:134c with SMTP id z8-20020a05635852c800b00134e964134cmr8509262rwz.11.1694103022523;
        Thu, 07 Sep 2023 09:10:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-134-41-202-196.dhcp-dynamic.fibreop.ns.bellaliant.net. [134.41.202.196])
        by smtp.gmail.com with ESMTPSA id m17-20020a0cdb91000000b006418c076f59sm6395881qvk.100.2023.09.07.09.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:10:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qeHaG-00170I-NH;
	Thu, 07 Sep 2023 13:10:20 -0300
Date: Thu, 7 Sep 2023 13:10:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Cc: Christoph Hellwig <hch@lst.de>, Kim Phillips <kim.phillips@amd.com>,
	joro@8bytes.org, iommu@lists.linux.dev,
	Michael Roth <michael.roth@amd.com>,
	"Kalra, Ashish" <Ashish.Kalra@amd.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH] iommu/amd: remove amd_iommu_snp_enable
Message-ID: <ZPn17E94bVUKIs+U@ziepe.ca>
References: <20230831123107.280998-1-hch@lst.de>
 <d33f6abe-5de1-fdba-6a69-51bcbf568c81@amd.com>
 <20230901055020.GA31908@lst.de>
 <ZPiAUx9Qysw0AKNq@ziepe.ca>
 <d230d9f5-53bd-8ea1-d4c7-717b0e8be9b9@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d230d9f5-53bd-8ea1-d4c7-717b0e8be9b9@amd.com>

On Thu, Sep 07, 2023 at 04:55:52PM +0700, Suthikulpanit, Suravee wrote:

> > I've said this many times lately. There are other things in this
> > driver that have no upstream justification too, like nesting
> > "support".
> 
> Jason, there is no need to keep repeating and polluting this thread. I am
> happy to discuss and clarify any points of your concern on the "nesting
> support" in a separate discussion thread :)

It is not polluting this thread. We are, again, asking AMD to follow
the rules please.

None of the other threads about the nesting has resulted in acceptance
that code needs to be removed as well. Go respond in one of those if
you have something to add.

Jason
