Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3333CF
	for <linux-coco@lists.linux.dev>; Sat,  5 Nov 2022 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667664530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUTpwZXcHKBBOGjhf3w1JmuycDZgyHPrZ7gV2/o5GE8=;
	b=eJfxrjHEX7hydfZZLK6wEAbndPfmoh23s8J9/g/OLuR9Rf3YCvb9YdZoXCKwzgISEYILSo
	CEtAgseV0Qw0yTYJ6+QtWcdtSyg/NHe523p84YFEwX0CHOvKsgV+iiBSQ5wyPdu0toGc2P
	+IW9iYnsIOBtKk4eXjlho4EhHwchylw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-DvG0LDXEOlaKHKlF_iy7yA-1; Sat, 05 Nov 2022 12:08:45 -0400
X-MC-Unique: DvG0LDXEOlaKHKlF_iy7yA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C71D1380452A;
	Sat,  5 Nov 2022 16:08:44 +0000 (UTC)
Received: from [10.22.10.76] (unknown [10.22.10.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FFDB492B0E;
	Sat,  5 Nov 2022 16:08:44 +0000 (UTC)
Message-ID: <91c2eaad-92fc-4251-f9e9-7d73cf2b5da5@redhat.com>
Date: Sat, 5 Nov 2022 12:08:43 -0400
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] virt: sev-guest: Add MODULE_ALIAS
To: Borislav Petkov <bp@suse.de>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 thomas.lendacky@amd.com, brijesh.singh@amd.com
References: <ff480c5e688eb0a72a4db0a29c7b1bb54c45bfd4.1667594253.git.crobinso@redhat.com>
 <Y2V7w6PCUV/IxLBl@zn.tnic>
Content-Language: en-US
From: Cole Robinson <crobinso@redhat.com>
In-Reply-To: <Y2V7w6PCUV/IxLBl@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

On 11/4/22 4:53 PM, Borislav Petkov wrote:
> On Fri, Nov 04, 2022 at 04:42:45PM -0400, Cole Robinson wrote:
>> This fixes driver autoloading
> 
> What is the scenario where this needs to be autoloaded?
> 

Any use case that needs /dev/sev-guest, I guess. Saves software from
having to do the modprobe manually. For example, nothing I can find in
https://github.com/AMDESE/sev-guest loads the driver, it expects
/dev/sev-guest to be there already

Mostly I assumed lack of autoloading was an oversight. Was it
intentionally omitted?

Thanks,
Cole

